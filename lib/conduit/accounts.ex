defmodule Conduit.Accounts do
  @moduledoc """
  The boundary for the Accounts context.
  """

  alias Conduit.Accounts.Commands.RegisterUser
  alias Conduit.Accounts.Projections.User
  alias Conduit.Repo
  alias Conduit.Router

  @doc """
  Register a new user.
  """
  def register_user(attrs \\ %{}) do
    uuid = UUID.uuid4()

    register_user =
      attrs
      |> assign_uuid(:user_uuid, uuid)
      |> RegisterUser.new()

    case Router.dispatch(register_user, consistency: :strong) do
      :ok -> get(User, uuid)
      reply -> reply
    end
  end

  defp get(schema, uuid) do
    case Repo.get(schema, uuid) do
      nil -> {:error, :not_found}
      projection -> {:ok, projection}
    end
  end

  defp assign_uuid(attrs, identity, uuid),
    do: Map.put(attrs, identity, uuid)
end