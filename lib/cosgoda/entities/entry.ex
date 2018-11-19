defmodule Cosgoda.Entity.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
