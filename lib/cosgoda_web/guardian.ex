defmodule CosgodaWeb.Guardian do
  @moduledoc false

  use Guardian, otp_app: :cosgoda
  alias Cosgoda.UsersContext

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    {:ok, UsersContext.get!(claims["id"])}
  end
end
