defmodule SearchPlayersApp.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :position, :string
      add :age, :integer
      add :team, :string
      add :nationality, :string

      timestamps()
    end
    create unique_index(:players, [:name])
  end
end
