defmodule SearchPlayersAppWeb.PlayerJSON do
  alias SearchPlayersApp.Players.Player

  @doc """
  Renders a list of players.
  """
  def index(%{players: players}) do
    %{data: for(player <- players, do: data(player))}
  end

  @doc """
  Renders a single player.
  """
  def show(%{player: player}) do
    %{data: data(player)}
  end

  defp data(%Player{} = player) do
    %{
      id: player.id,
      name: player.name,
      position: player.position,
      age: player.age,
      team: player.team,
      nationality: player.nationality
    }
  end
end
