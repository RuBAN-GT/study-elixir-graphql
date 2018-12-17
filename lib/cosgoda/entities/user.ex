defmodule Cosgoda.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Comeonin.Argon2, only: [hashpwsalt: 1]

  schema "users" do
    field :email, :string
    field :login, :string

    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :login, :password])
    |> validate_required([:email, :login, :password])
    |> validate_length(:login, min: 3, max: 30)
    |> validate_length(:password, min: 3, max: 30)
    |> unique_constraint(:email, downcase: true)
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case(changeset) do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        change(changeset, password_hash: hashpwsalt(password))

      _ ->
        changeset
    end
  end
end
