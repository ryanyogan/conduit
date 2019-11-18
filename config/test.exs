use Mix.Config

config :conduit, Conduit.Repo,
  username: "postgres",
  password: "postgres",
  database: "conduit_readstore_test",
  hostname: "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 5

config :eventstore, EventStore.Storage,
  serializer: Commanded.Serialization.JsonSerializer,
  username: "postgres",
  password: "postgres",
  database: "conduit_eventstore_test",
  hostname: "localhost",
  pool_size: 5

config :conduit, ConduitWeb.Endpoint,
  http: [port: 4002],
  server: false

config :logger, level: :warn
