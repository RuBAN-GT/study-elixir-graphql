defmodule Cosgoda.AccountsContext do
  import Ecto.Query, warn: false

  alias Cosgoda.Repo
  alias Cosgoda.User

  def get_by_credits!(%{email: email}) do
    Repo.get_by!(User, email: email)
  end

  def create(attrs) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end
end
