use Mix.Config

config :logger, :console,
  level: :info,
  format: "$message
"

# disable lager output
config :lager,
  error_logger_redirect: false,
  handlers: []

config :class_roll, ClassRoll.DB.Postgres,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL")
