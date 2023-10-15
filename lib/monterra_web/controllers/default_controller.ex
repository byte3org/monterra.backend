defmodule MonterraWeb.DefaultController do
  use MonterraWeb, :controller

  def index(conn, _params) do
    text(conn, "Monterra API is live - #{Mix.env()}")
  end
end
