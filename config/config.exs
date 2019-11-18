use Mix.Config

config :conduit,
  ecto_repos: [Conduit.Repo]

config :conduit, ConduitWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tpOrvtJcMEyx+MIE31knowngXzTCdIpJA34joE32vtcwsvAEBfMJGsrbtcRsxDWz",
  render_errors: [view: ConduitWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Conduit.PubSub, adapter: Phoenix.PubSub.PG2]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :commanded,
  event_store_adapter: Commanded.EventStore.Adapters.EventStore

config :commanded_ecto_projections,
  repo: Conduit.Repo

import_config "#{Mix.env()}.exs"
