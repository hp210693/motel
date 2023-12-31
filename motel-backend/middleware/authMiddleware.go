package middleware

import (
	"motel-backend/token"
	"net/http"
	"strings"

	"github.com/labstack/echo/v4"
)

func AuthMiddleware(tokenMaker token.Maker, next echo.HandlerFunc) echo.HandlerFunc {
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

		switch payload.Role {
		case "admin", "host", "manager":
			return next(ctx)
		}
		//ctx.Set("authorization_payload", payload)

		return echo.NewHTTPError(http.StatusUnauthorized, "Account is not permission access %s")
	}
}
