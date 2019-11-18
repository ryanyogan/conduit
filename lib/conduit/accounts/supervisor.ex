defmodule Conduit.Accounts.Supervisor do
  use Supervisor

  alias Conduit.Accounts

  @name __MODULE__

  def start_link(),
    do: Supervisor.start_link(@name, [], name: @name)

  def init(_args),
    do:
      Supervisor.init(
        [
          Accounts.Projectors.User
        ],
        strategy: :one_for_one
      )
end
