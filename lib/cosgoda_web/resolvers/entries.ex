defmodule CosgodaWeb.Resolvers.Entries do
  alias Cosgoda.Entries, as: Context

  def list(_parent, _args, _resolution) do
    {:ok, Context.list}
  end

  def get(_parent, %{id: id}, _resolution) do
    case Context.get(id) do
      nil   -> {:error, "Entry #{id} not found"}
      entry -> {:ok, entry}
    end
  end

  def create(_parent, %{params: params}, _resolution) do
    Context.create params
  end

  def delete(_parent, %{id: id}, _resolution) do
    Context.get(id) |> Context.delete
  end
end
