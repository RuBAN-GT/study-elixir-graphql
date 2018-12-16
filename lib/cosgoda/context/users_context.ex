defmodule Cosgoda.UsersContext do
  @moduledoc """
  The Users context.
  """

  import Ecto.Query, warn: false
  alias Cosgoda.Repo
  alias Cosgoda.User

  def list do
    Repo.all(User)
  end

  def get(id), do: Repo.get(User, id)
  def get!(id), do: Repo.get!(User, id)

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete(%User{} = user) do
    Repo.delete(user)
  end

  def change(%User{} = user) do
    User.changeset(user, %{})
  end
end
