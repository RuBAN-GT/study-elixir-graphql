defmodule CosgodaWeb.AuthServiceTest do
  use Cosgoda.DataCase

  import Cosgoda.Factory

  alias Cosgoda.AccountsContext
  alias CosgodaWeb.AuthService

  @common_password Faker.Pizza.vegetable()

  def valid_user_params do
    params_for(:user, %{password: @common_password})
  end

  def user_fixture do
    insert :user, valid_user_params
  end

  describe "sign_in/1" do
    test "returns user token with correct data" do
      params = %{email: user_fixture().email, password: @common_password}

      assert {:ok, token} = AuthService.sign_in(params)
      assert is_bitstring(token)
    end

    test "returns `Ecto.NoResultsError` for undefined user" do
      params = %{email: Faker.Internet.email(), password: @common_password}

      assert_raise Ecto.NoResultsError, fn ->
        AuthService.sign_in(params)
      end
    end

    test "returns `Ecto.NoResultsError` for wrong password of existed user" do
      params = %{email: user_fixture().email, password: Faker.Lorem.word()}

      assert_raise Ecto.NoResultsError, fn ->
        AuthService.sign_in(params)
      end
    end
  end

  describe "sign_up/1" do
    test "returns user token for newbie user" do
      assert {:ok, token} = AuthService.sign_up(valid_user_params)
      assert is_bitstring(token)
    end

    test "returns error for invalid params" do
      invalid_params = params_for(:user, %{login: ""})
      assert {:error, _} = AuthService.sign_up(invalid_params)
    end
  end
end
