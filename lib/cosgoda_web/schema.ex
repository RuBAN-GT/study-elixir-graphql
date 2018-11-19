defmodule CosgodaWeb.Schema do
  use Absinthe.Schema

  import_types CosgodaWeb.Schema.Entries
  import_types CosgodaWeb.Schema.Users

  query do
    import_fields :entry_query
    import_fields :user_query
  end

  mutation do
    import_fields :entry_mutation
  end
end
