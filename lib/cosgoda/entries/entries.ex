defmodule Cosgoda.Entries do
  @moduledoc """
  The Entries context.
  """

  import Ecto.Query, warn: false
  alias Cosgoda.Repo
  alias Cosgoda.Entries.Entry

  @doc """
  Returns the list of entries.

  ## Examples

      iex> list()
      [%Entry{}, ...]

  """
  def list do
    Repo.all Entry
  end

  def get(id), do: Repo.get(Entry, id)

  @doc """
  Gets a single entry.

  Raises `Ecto.NoResultsError` if the Entry does not exist.

  ## Examples

      iex> get!(123)
      %Entry{}

      iex> get!(456)
      ** (Ecto.NoResultsError)

  """
  def get!(id), do: Repo.get!(Entry, id)

  @doc """
  Creates a entry.

  ## Examples

      iex> create(%{field: value})
      {:ok, %Entry{}}

      iex> create(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create(attrs \\ %{}) do
    %Entry{}
    |> Entry.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a entry.

  ## Examples

      iex> update(entry, %{field: new_value})
      {:ok, %Entry{}}

      iex> update(entry, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update(%Entry{} = entry, attrs) do
    entry
    |> Entry.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Entry.

  ## Examples

      iex> delete(entry)
      {:ok, %Entry{}}

      iex> delete(entry)
      {:error, %Ecto.Changeset{}}

  """
  def delete(%Entry{} = entry) do
    Repo.delete(entry)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking entry changes.

  ## Examples

      iex> change(entry)
      %Ecto.Changeset{source: %Entry{}}

  """
  def change(%Entry{} = entry) do
    Entry.changeset(entry, %{})
  end
end
