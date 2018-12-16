defmodule CosgodaWeb.AuthServiceTest do
  use Cosgoda.DataCase

  alias Cosgoda.AccountsContext
  alias CosgodaWeb.AuthService

  @valid_sign_up_params %{email: "user@user.user", login: "sample", password: "sample"}

  def user_fixture do
    @valid_sign_up_params |> AccountsContext.create
  end

  describe "sign_in/1" do
    @valid_params %{email: "user@user.user", password: "sample"}
    @undefined_params %{email: "undefined@user.user", password: "sample"}

    test "returns user token with correct data" do
      user_fixture()

      assert {:ok, token} = AuthService.sign_in(@valid_params)
      assert is_bitstring(token)
    end

    test "returns `Ecto.NoResultsError` for undefined user" do
      assert_raise Ecto.NoResultsError, fn ->
        AuthService.sign_in(@undefined_params)
      end
    end
  end

  describe "sign_up/1" do
    @invalid_params %{email: "user@user.user", login: "", password: "sample"}

    test "returns user token for newbie user" do
      assert {:ok, token} = AuthService.sign_up(@valid_sign_up_params)
      assert is_bitstring(token)
    end

    test "returns error for invalid params" do
      assert {:error, _} = AuthService.sign_up(@invalid_params)
    end
  end
end
