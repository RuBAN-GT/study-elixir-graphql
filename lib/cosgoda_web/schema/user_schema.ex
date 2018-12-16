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

  @desc "Group of arguments for sign in"
  input_object :sign_in_params do
    field :email, non_null(:string)
    field :password, non_null(:string)
  end

  @desc "Group of arguments for registration of a user"
  input_object :sign_up_params do
    field :email, non_null(:string)
    field :login, non_null(:string)
    field :password, non_null(:string)
  end

  object :user_query do
    @desc "Get information about current user"
    field :me, non_null(:user) do
      resolve(&Resolver.current_user/3)
    end
  end

  object :user_mutation do
    field :sign_in, :string do
      arg(:params, non_null(:sign_in_params))
      resolve(&Resolver.sign_in/3)
    end

    field :sign_up, :user do
      arg(:params, non_null(:sign_up_params))
      resolve(&Resolver.sign_up/3)
    end
  end
end
