defmodule CosgodaWeb.UsersResolver do
  alias CosgodaWeb.AuthService
  alias Cosgoda.User

  def sign_in(_, %{params: params}, _) do
    AuthService.sign_in(params)
  end

  def sign_up(_, %{params: params}, _) do
    AuthService.sign_up(params)
  end

  def current_user(_, _, %{context: %{current_user: %User{} = user}}) do
    {:ok, user}
  end

  def current_user(_, _, _), do: {:error, "Unauthorized"}
end
