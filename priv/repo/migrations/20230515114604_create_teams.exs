defmodule SearchPlayersApp.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :division, :string
      add :country, :string
      add :player_id, references(:players, on_delete: :delete_all, type: :binary_id)

      timestamps()
    end

    create index(:teams, [:player_id])
  end
end
