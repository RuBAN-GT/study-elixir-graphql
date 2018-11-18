defmodule Cosgoda.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :name, :string
      add :description, :text

      timestamps()
    end
  end
end
