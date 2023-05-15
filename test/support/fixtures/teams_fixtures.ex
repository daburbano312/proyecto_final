defmodule SearchPlayersApp.TeamsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SearchPlayersApp.Teams` context.
  """

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        country: "some country",
        division: "some division",
        name: "some name"
      })
      |> SearchPlayersApp.Teams.create_team()

    team
  end
end
