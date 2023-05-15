defmodule SearchPlayersApp.Teams.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "teams" do
    field :country, :string
    field :division, :string
    field :name, :string
    #field :player_search, :binary_id
    belongs_to :player, SearchPlayersApp.Players.Player

    timestamps()
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :division, :country, :player_id])
    |> validate_required([:name, :division, :country, :player_id])
  end
end
