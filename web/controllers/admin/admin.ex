defmodule Ppush.Admin do
  use Ppush.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "Admin authentication required")
    |> redirect(to: session_path(conn, :new))
  end
end
