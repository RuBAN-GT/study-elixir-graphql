defmodule CosgodaWeb.Resolvers.Users do
  alias Cosgoda.Context.Users, as: Context

  def list(_parent, _args, _resolution) do
    {:ok, Context.list}
  end
end
