defmodule Conduit.Accounts.Commands.RegisterUser do
  @moduledoc false

  defstruct [
    :user_uuid,
    :username,
    :email,
    :password,
    :hashed_password
  ]

  use ExConstructor
end
