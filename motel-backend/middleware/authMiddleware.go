package middleware

import (
	"log"
	"motel-backend/token"
	"net/http"
	"strings"

	"github.com/labstack/echo/v4"
)

func AuthMiddleware(tokenMaker token.Maker, next echo.HandlerFunc) echo.HandlerFunc {
	log.Println("vao AuthMiddleware")
	return func(ctx echo.Context) error {

		var header = ctx.Request().Header.Get("Authorization")

		if len(header) == 0 {
			return echo.NewHTTPError(http.StatusUnauthorized, "Authorization header is not provided")
		}

		fields := strings.Fields(header)
		if len(fields) < 2 {
			return echo.NewHTTPError(http.StatusUnauthorized, "Invalid authorization header format")
		}

		authType := strings.ToLower(fields[0])
		if authType != "bearer" {
			return echo.NewHTTPError(http.StatusUnauthorized, "Unsupported authorization type %s"+authType)
		}

		accessToken := fields[1]

		payload, err := tokenMaker.VerifyToken(accessToken)
		if err != nil {
			return echo.NewHTTPError(http.StatusUnauthorized, err)
		}

		ctx.Set("authorization_payload", payload)

		return next(ctx)
	}
}
