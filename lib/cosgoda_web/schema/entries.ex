defmodule CosgodaWeb.Schema.Entries do
  alias CosgodaWeb.Resolvers

  use Absinthe.Schema.Notation

  object :entry do
    @desc "Entry as data unit"
    field :id, :id
    field :name, :string
    field :description, :string
    field :inserted_at, :string
    field :updated_at, :string
  end

  input_object :new_entry_params do
    field :name, :string
    field :description, :string
  end

  input_object :update_entry_params do
    field :name, :string
    field :description, :string
  end

  object :entry_query do
    @desc "Get entries"
    field :entries, list_of(:entry) do
      resolve &Resolvers.Entries.list/3
    end

    @desc "Get entry"
    field :entry, :entry do
      arg :id, non_null(:id)
      resolve &Resolvers.Entries.get/3
    end
  end

  object :entry_mutation do
    @desc "Create new entry"
    field :create_entry, :entry do
      arg :params, non_null(:new_entry_params)
      resolve &Resolvers.Entries.create/3
    end

    @desc "Update existed entry"
    field :update_entry, :entry do
      arg :id, non_null(:id)
      arg :params, non_null(:update_entry_params)
      resolve &Resolvers.Entries.update/3
    end

    @desc "Remove selected"
    field :delete_entry, :entry do
      arg :id, non_null(:id)
      resolve &Resolvers.Entries.delete/3
    end
  end
end
