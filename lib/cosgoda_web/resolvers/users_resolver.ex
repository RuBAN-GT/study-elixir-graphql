defmodule CosgodaWeb.UsersResolver do
  alias Cosgoda.UsersContext, as: Context
  alias Cosgoda.User

  def list(_, _, _) do
    {:ok, Context.list}
  end

  def sign_up(_, %{params: params}, _) do
    Context.create params
  end

  def current_user(_, _, %{context: %{current_user: %User{} = user}}) do
    {:ok, user}
  end
  def current_user(_, _, _), do: {:error, "Unauthorized"}
end
