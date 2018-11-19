defmodule Cosgoda.Context.MembersTest do
  use Cosgoda.DataCase

  alias Cosgoda.Context.Members

  describe "users" do
    alias Cosgoda.Context.Members.Entity.User

    @valid_attrs %{email: "some email", login: "some login"}
    @update_attrs %{email: "some updated email", login: "some updated login"}
    @invalid_attrs %{email: nil, login: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Members.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Members.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Members.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Members.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.login == "some login"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Members.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Members.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.login == "some updated login"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Members.update_user(user, @invalid_attrs)
      assert user == Members.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Members.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Members.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Members.change_user(user)
    end
  end
end
