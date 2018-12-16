defmodule Cosgoda.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :login, :string
      add :password_hash, :string
      add :password_salt, :string

      timestamps()
    end
  end
end
