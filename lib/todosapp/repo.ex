defmodule Todosapp.Repo do
  use Ecto.Repo,
    otp_app: :todosapp,
    adapter: Ecto.Adapters.Postgres
end
