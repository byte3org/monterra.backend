defmodule Monterra.Repo do
  use Ecto.Repo,
    otp_app: :monterra,
    adapter: Ecto.Adapters.Postgres
end
