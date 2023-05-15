defmodule SearchPlayersApp.Players.Player do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "players" do
    field :age, :integer
    field :name, :string
    field :nationality, :string
    field :position, :string
    field :team, :string
    has_many :teams, SearchPlayersApp.Teams.Team

    timestamps()
  end

  @doc false
  def changeset(player, attrs) do
    player
    |> cast(attrs, [:name, :position, :age, :team, :nationality])
    |> validate_required([:name, :position, :age, :team, :nationality])
    |> validate_age_range()
  end

  defp validate_age_range(changeset) do
    min_age = 17
    max_age = 35

    validate_change(changeset, :age, fn _, age ->
      if age < min_age or age > max_age do
        [age: "must be between #{min_age} and #{max_age}"]
      else
        []
      end
    end)
  end

end
