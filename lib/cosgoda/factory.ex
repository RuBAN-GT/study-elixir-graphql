defmodule Cosgoda.Factory do
  use ExMachina.Ecto, repo: Cosgoda.Repo

  def user_factory do
    %Cosgoda.User{
      email: Faker.Internet.email(),
      login: Faker.Internet.user_name(),
      password: "sample"
    }
  end
end
