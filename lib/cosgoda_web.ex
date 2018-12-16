defmodule CosgodaWeb do
  @moduledoc """
  The entrypoint for defining your web interface, such
  as controllers, views, channels and so on.
  """

  def controller do
    quote do
      use Phoenix.Controller, namespace: CosgodaWeb

      import Plug.Conn
      import CosgodaWeb.Gettext
      alias CosgodaWeb.Router.Helpers, as: Routes
    end
  end

  def view do
    quote do
      import CosgodaWeb.ErrorHelpers
      import CosgodaWeb.Gettext
      alias CosgodaWeb.Router.Helpers, as: Routes
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import Plug.Conn
      import Phoenix.Controller
    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import CosgodaWeb.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
