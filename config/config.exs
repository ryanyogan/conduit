use Mix.Config

config :conduit,
  ecto_repos: [Conduit.Repo]

config :conduit, ConduitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pBkxKx/oSMsK5rpE+NmKutTVw0DUuRs5E3Nv0IXPUEnQRM7X0Xv+FxC/dRRjuLik",
  render_errors: [view: ConduitWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Conduit.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

import_config "#{Mix.env()}.exs"
