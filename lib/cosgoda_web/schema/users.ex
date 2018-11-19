defmodule CosgodaWeb.Schema.Users do
  alias CosgodaWeb.Resolvers

  use Absinthe.Schema.Notation

  object :user do
    @desc "User structure"
    field :id, :id
    field :email, :string
    field :login, :string
    field :inserted_at, :string
    field :updated_at, :string
  end

  object :user_query do
    @desc "Get available users"
    field :users, list_of(:user) do
      resolve &Resolvers.Users.list/3
    end
  end
end
