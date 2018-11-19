defmodule CosgodaWeb.Schema do
  use Absinthe.Schema
  alias CosgodaWeb.Resolvers

  import_types CosgodaWeb.Schema.BasicTypes

  query do
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

  mutation do
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
