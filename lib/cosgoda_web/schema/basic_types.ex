defmodule CosgodaWeb.Schema.BasicTypes do
  use Absinthe.Schema.Notation

  object :entry do
    @desc "Entry as data unit"
    field :id, :id
    field :name, :string
    field :description, :string
  end

  input_object :new_entry_params do
    field :name, :string
    field :description, :string
  end

  input_object :update_entry_params do
    field :name, :string
    field :description, :string
  end
end
