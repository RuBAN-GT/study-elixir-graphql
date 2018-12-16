defmodule CosgodaWeb.Schema do
  use Absinthe.Schema

  import_types CosgodaWeb.UserSchema

  query do
    import_fields :user_query
  end

  mutation do
    import_fields :user_mutation
  end
end
