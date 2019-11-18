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

    @tag :integration
    test "should fail with invalid data and returns an error" do
      assert {:error, :validation_failure, errors} =
               Accounts.register_user(build(:user, username: ""))

      assert errors == %{username: ["can't be empty"]}
    end

    @tag :integration
    test "should fail when username is already taken" do
      assert {:ok, %User{}} = Accounts.register_user(build(:user))
      assert {:error, :validation_failure, errors} = Accounts.register_user(build(:user))

      assert errors == %{username: ["has already been taken"]}
    end
  end
end
