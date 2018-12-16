defmodule CosgodaWeb.AuthService do
  alias Cosgoda.AccountsContext
  alias Cosgoda.User
  alias CosgodaWeb.Guardian

  def handle_token(token) do
    Guardian.resource_from_token(token)
  end

  def generate_token(%User{} = user) do
    with {:ok, token, _} <- Guardian.encode_and_sign(user), do: token
  end

  def sign_in(params) do
    user = AccountsContext.get_by_credits!(params)
    {:ok, generate_token(user)}
  end

  def sign_up(params) do
    with {:ok, user} <- AccountsContext.create(params),
         {:ok, token, _} <- Guardian.encode_and_sign(user) do
      {:ok, token}
    end
  end
end
