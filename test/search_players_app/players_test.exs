defmodule SearchPlayersApp.PlayersTest do
  use SearchPlayersApp.DataCase

  alias SearchPlayersApp.Players

  describe "players" do
    alias SearchPlayersApp.Players.Player

    import SearchPlayersApp.PlayersFixtures

    @invalid_attrs %{age: nil, name: nil, nationality: nil, position: nil, team: nil}

    test "list_players/0 returns all players" do
      player = player_fixture()
      assert Players.list_players() == [player]
    end

    test "get_player!/1 returns the player with given id" do
      player = player_fixture()
      assert Players.get_player!(player.id) == player
    end

    test "create_player/1 with valid data creates a player" do
      valid_attrs = %{age: 42, name: "some name", nationality: "some nationality", position: "some position", team: "some team"}

      assert {:ok, %Player{} = player} = Players.create_player(valid_attrs)
      assert player.age == 42
      assert player.name == "some name"
      assert player.nationality == "some nationality"
      assert player.position == "some position"
      assert player.team == "some team"
    end

    test "create_player/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Players.create_player(@invalid_attrs)
    end

    test "update_player/2 with valid data updates the player" do
      player = player_fixture()
      update_attrs = %{age: 43, name: "some updated name", nationality: "some updated nationality", position: "some updated position", team: "some updated team"}

      assert {:ok, %Player{} = player} = Players.update_player(player, update_attrs)
      assert player.age == 43
      assert player.name == "some updated name"
      assert player.nationality == "some updated nationality"
      assert player.position == "some updated position"
      assert player.team == "some updated team"
    end

    test "update_player/2 with invalid data returns error changeset" do
      player = player_fixture()
      assert {:error, %Ecto.Changeset{}} = Players.update_player(player, @invalid_attrs)
      assert player == Players.get_player!(player.id)
    end

    test "delete_player/1 deletes the player" do
      player = player_fixture()
      assert {:ok, %Player{}} = Players.delete_player(player)
      assert_raise Ecto.NoResultsError, fn -> Players.get_player!(player.id) end
    end

    test "change_player/1 returns a player changeset" do
      player = player_fixture()
      assert %Ecto.Changeset{} = Players.change_player(player)
    end
  end
end
