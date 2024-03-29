defmodule SearchPlayersApp.PlayersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SearchPlayersApp.Players` context.
  """

  @doc """
  Generate a player.
  """
  def player_fixture(attrs \\ %{}) do
    {:ok, player} =
      attrs
      |> Enum.into(%{
        age: 42,
        name: "some name",
        nationality: "some nationality",
        position: "some position",
        team: "some team"
      })
      |> SearchPlayersApp.Players.create_player()

    player
  end
end
