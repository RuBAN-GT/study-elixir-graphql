defmodule CosgodaWeb.UsersResolver do
  alias Cosgoda.UsersContext, as: Context

  def list(_parent, _args, _resolution) do
    {:ok, Context.list}
  end

  def sign_up(_parent, _args, _resolution) do
    {:ok, Context.list}
  end
end
