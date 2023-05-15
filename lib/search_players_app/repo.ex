defmodule SearchPlayersApp.Repo do
  use Ecto.Repo,
    otp_app: :search_players_app,
    adapter: Ecto.Adapters.Postgres
end
