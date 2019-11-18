defmodule Conduit.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Conduit.Repo, []),
      supervisor(ConduitWeb.Endpoint, []),
      supervisor(Conduit.Accounts.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Conduit.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ConduitWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
