defmodule ConduitWeb.UserControllerTest do
  use ConduitWeb.ConnCase

  import Conduit.Factory
  alias Conduit.Accounts

  def fixture(:user, attrs \\ []) do
    build(:user, attrs)
    |> Accounts.create_user()
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "register user" do
    @tag :web
    test "should create and return a user with valid data", %{conn: conn} do
      conn = post conn, Routes.user_path(conn, :create), user: build(:user)
      json = json_response(conn, 201)["user"]

      assert json == %{
               "bio" => nil,
               "email" => "ryan@ryan.ryan",
               "image" => nil,
               "username" => "ryan"
             }
    end

    @tag :web
    test "should not create and render errors with invalid data", %{conn: conn} do
      conn = post conn, Routes.user_path(conn, :create), user: build(:user, username: "")

      assert json_response(conn, 422)["errors"] == %{
               "username" => [
                 "can't be empty"
               ]
             }
    end

    @tag :web
    test "should not create user and render errors when username is taken", %{conn: conn} do
      # attempt same user from setup block
      {:ok, _user} = fixture(:user)

      conn =
        post conn, Routes.user_path(conn, :create), user: build(:user, email: "ryan2@ryan.ryan")

      assert json_response(conn, 422)["errors"] == %{
               "username" => [
                 "has already been taken"
               ]
             }
    end
  end
end
