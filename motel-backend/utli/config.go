package utli

import (
	"fmt"
	"time"

	"github.com/spf13/viper"
)

type Config struct {
	Environment         string        `mapstructure:"ENVIRONMENT"`
	DBSource            string        `mapstructure:"DB_SOURCE"`
	DBMigrationURL      string        `mapstructure:"DB_MIGRATION_URL"`
	DBImage             string        `mapstructure:"DB_IMAGE"`
	DBUser              string        `mapstructure:"DB_USER"`
	DBName              string        `mapstructure:"DB_NAME"`
	DBPassword          string        `mapstructure:"DB_PASSWORD"`
	DBProjectName       string        `mapstructure:"DB_PROJECT_NAME"`
	DBPort              string        `mapstructure:"DB_PORT"`
	HTTPServerAddress   string        `mapstructure:"HTTP_SERVER_ADDRESS"`
	SymmetricKey        string        `mapstructure:"SYMMETRIC_KEY"`
	AccessTokenDuration time.Duration `mapstructure:"ACCESS_TOKEN_DURATION"`
}

func LoadConfig() (config Config, err error) {
	var env = NewEnvironment()
	viper.AddConfigPath(env.Path)
	viper.SetConfigName(env.Dev)
	viper.SetConfigType(env.Type)
	viper.AutomaticEnv()

	if err := viper.ReadInConfig(); err != nil {
		if _, ok := err.(viper.ConfigFileNotFoundError); ok {
			panic(fmt.Errorf("Config file not found; ignore error if desired: %w", err))

		} else {
			panic(fmt.Errorf("Config file was found but another error was produced: %w", err))
		}
	}

	if err = viper.Unmarshal(&config); err != nil {
		panic(fmt.Errorf("%s %w", "Unable to decode into struct:", err))
	}
	return
}
