defmodule CosgodaWeb.Context do
  @behaviour Plug

  import Plug.Conn, only: [get_req_header: 2]
  alias Cosgoda.UsersContext

  def init(opts), do: opts

  def call(conn, _) do
    Absinthe.Plug.put_options conn, context: build_context(conn)
  end

  def build_context(conn) do
    get_req_header(conn, "x-user-id") |> get_user_by_header
  end

  defp get_user_by_header([id | _]) when is_binary(id) do
    %{current_user: UsersContext.get(id)}
  end
  defp get_user_by_header(_), do: %{current_user: nil}
end
