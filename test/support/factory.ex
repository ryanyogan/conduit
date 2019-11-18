defmodule Conduit.Factory do
  use ExMachina

  alias Conduit.Accounts.Commands.RegisterUser

  def user_factory do
    %{
      email: "ryan@ryan.ryan",
      username: "ryan",
      hashed_password: "ryanryan",
      bio: "My password is ryanryan",
      image: "https://i.stack.imgur.com/xHWG8.jpg"
    }
  end

  def register_user_factory,
    do: struct(RegisterUser, build(:user))
end
