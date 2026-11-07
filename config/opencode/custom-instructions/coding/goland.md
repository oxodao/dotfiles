# General

* Never use inline error assignments inside `if` statements (`if err := ...; err != nil`).

# Often used libraries

- spf13/cobra
- gin-gonic/gin
- vinovest/sqlx
- goccy/go-yaml
- oxodao/micromigrations
- oxodao/micromigrations-zap-adapter
- go.uber.org/zap
- go.uber.org/multierr

# General project structure

- cmd: All the cobra's commands
- config: Struct that holds all the config, parsed from either yaml or env vars
- dal: Data access layer, everything that talks with the database
- logger: Zap instance and easier access helper methods
- models: The DB models
- dto: The DTO for the routes
- routes: Backend routes

## cmd

The root command must at least have this persistent pre-run, if there is both config and logger of course:
```go
PersistentPreRun: func(cmd *cobra.Command, args []string) {
	config.Init()
	logger.MustLoad()
},
```

## config

Here's an exemple of config

```go
package config

import (
	"fmt"
	"os"
	"path/filepath"
	"strings"

	"github.com/goccy/go-yaml"
)

var GET Config

type WebServer struct {
	ListeningAddr string `yaml:"listening_addr"`
	ListeningPort string `yaml:"listening_port"`
}

func (ws WebServer) GetListeningAddr() string {
	if len(ws.ListeningAddr) == 0 {
		ws.ListeningAddr = "0.0.0.0"
	}

	if len(ws.ListeningPort) == 0 {
		ws.ListeningPort = "3595"
	}

	return fmt.Sprintf("%s:%s", ws.ListeningAddr, ws.ListeningPort)
}

type Config struct {
	BaseDir     string    `yaml:"-"`
	WebServer   WebServer `yaml:"web_server"`
	Environment string    `yaml:"environment"`
	LogLevel    string    `yaml:"log_level"`
}

func Init() {
	basePath := strings.TrimSpace(os.Getenv("MYAPP_BASE_PATH"))
	if len(basePath) == 0 {
		panic("No base path set. Please set the MYAPP_BASE_PATH environment")
	}

	if _, err := os.Stat(basePath); os.IsNotExist(err) {
		panic("MyApp folder does not exist")
	}

	GET.BaseDir = basePath

	data, err := os.ReadFile(filepath.Join(basePath, "config.yaml"))
	if err != nil {
		panic(err)
	}

	err = yaml.Unmarshal(data, &GET)
	if err != nil {
		panic(err)
	}
}
```

## dal
Exemple only:

```go
package dal

import (
	"path/filepath"

	"myapp/config"
	"myapp/logger"
	"github.com/oxodao/micromigrations"
	"github.com/vinovest/sqlx"
)

var GET DbImpl

type DbImpl struct {
	DB *sqlx.DB
	Users Users
}

func Init() error {
	dbFile := filepath.Join(config.GET.BaseDir, "myapp.db")
	db, err := sqlx.Open("sqlite", dbFile)
	if err != nil {
		return err
	}

	mm := logger.NewZapLogger()
	adapter := micromigrations.NewSqliteQueriesAdapter()

	migrations := []micromigrations.Migration{} // This line should be in a migrations.go alongside the main dal file

	err = micromigrations.ApplyMigrations(
		mm,
		adapter,
		db.DB,
		migrations,
		false,
	)
	if err != nil {
		_ = db.Close()
		return err
	}

	GET.DB = db
	GET.Users = Users{DB: db}
	return nil
}

func MustInit() {
	if err := Init(); err != nil {
		panic(err)
	}
}

func Close() {
	if GET.DB == nil {
		return
	}

	if err := GET.DB.Close(); err != nil {
		logger.L().Error("failed to close database", logger.Error(err))
	}

	GET.DB = nil
}
```

The users class can be in its own file:
```
package dal

type Users {
	DB *sqlx.DB
}

func (Users u) Get(int id) (models.User, error) {
	// Do fetch from the DB
}
```


## routes

For the route, you need to create the router in the `cmd` serve command then use the `routes.RegisterRoutes(r.Group("/api"))` method.

Then routes can be splitter as you want:
```go
package routes

import "github.com/gin-gonic/gin"

func RegisterRoutes(r *gin.RouterGroup) {
	r.GET("/healthz", func(ctx *gin.Context) {
		ctx.JSON(200, map[string]any{
			"status": "ok",
		})
	})

	registerEmulatorRoutes(r.Group("/emu"))
}
```
