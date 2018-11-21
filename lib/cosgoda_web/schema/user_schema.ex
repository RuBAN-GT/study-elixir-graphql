defmodule CosgodaWeb.UserSchema do
  alias CosgodaWeb.UsersResolver, as: Resolver

  use Absinthe.Schema.Notation

  @desc "User structure"
  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
    field :login, non_null(:string)
    field :inserted_at, non_null(:string)
    field :updated_at, :string
  end

  @desc "Special params for registartion of a user"
  input_object :sign_up_user_params do
    field :email, non_null(:string)
    field :login, non_null(:string)
  end

  object :user_query do
    @desc "Get available users"
    field :users, list_of(:user) do
      resolve &Resolver.list/3
    end
  end

  object :user_mutation do
    field :sign_up, :user do
      arg :params, non_null(:sign_up_user_params)
      resolve &Resolver.sign_up/3
    end
  end
end
