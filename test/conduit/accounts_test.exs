defmodule Conduit.AccountsTest do
  use Conduit.DataCase

  alias Conduit.Accounts
  alias Accounts.Projections.User

  describe "register user" do
    @tag :integration
    test "should succeed with valid data" do
      assert {:ok, %User{} = user} = Accounts.register_user(build(:user))

      assert user.username == "ryan"
      assert user.email == "ryan@ryan.ryan"
      assert user.hashed_password == "ryanryan"

      assert user.image == nil
      assert user.bio == nil
    end
  end
end
