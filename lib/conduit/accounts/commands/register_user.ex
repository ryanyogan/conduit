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
  use Vex.Struct

  validates(:user_uuid, uuid: true)
  validates(:username, presence: [message: "can't be empty"], string: true)
  validates(:email, presence: [message: "can't be empty"], string: true)
  validates(:hashed_password, presence: [message: "can't be empty"], string: true)
end
