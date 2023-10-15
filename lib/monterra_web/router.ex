defmodule MonterraWeb.Router do
  use MonterraWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MonterraWeb do
    pipe_through :api
    get "/", DefaultController, :index
  end
end
