defmodule CosgodaWeb.Context do
  @behaviour Plug

  import Plug.Conn, only: [get_req_header: 2]
  alias CosgodaWeb.AuthService

  def init(opts), do: opts

  def call(conn, _) do
    Absinthe.Plug.put_options(conn, context: build_context(conn))
  end

  def build_context(conn) do
    get_req_header(conn, "Authentication") |> get_user_by_header
  end

  defp get_user_by_header(["Bearer" <> token | _]) do
    %{current_user: AuthService.handle_token(token)}
  end

  defp get_user_by_header(_), do: %{current_user: nil}
end
