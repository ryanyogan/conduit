defmodule Conduit.Accounts.Aggregates.User do
  defstruct [
    :uuid,
    :username,
    :email,
    :hashed_password
  ]

  alias __MODULE__
  alias Conduit.Accounts.{Commands, Events}
  alias Commands.RegisterUser
  alias Events.UserRegistered

  @doc """
  Register a new user.
  """
  def execute(%User{uuid: nil}, %RegisterUser{} = register),
    do: %UserRegistered{
      user_uuid: register.user_uuid,
      username: register.username,
      email: register.email,
      hashed_password: register.hashed_password
    }

  # state mutators

  def apply(%User{} = user, %UserRegistered{} = registered),
    do: %User{
      user
      | uuid: registered.user_uuid,
        username: registered.username,
        email: registered.email,
        hashed_password: registered.hashed_password
    }
end
