defmodule ConduitWeb.UserController do
  use ConduitWeb, :controller

  action_fallback ConduitWeb.FallbackController
end
