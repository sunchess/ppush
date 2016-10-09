defmodule Ppush.PageController do
  use Ppush.Web, :controller
  use Guardian.Phoenix.Controller
  #plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__, key: :admin
  #plug Guardian.Plug.VerifySession, key: :admin


  def index(conn, _params, current_user, _claims) do
    #IO.inspect(conn.cookies)

    conn
    |> put_resp_cookie("_csrf_token", get_csrf_token, http_only: false)
    |> render("index.html", current_user: current_user)
  end

  #def unauthenticated(conn, _params) do
    #  conn
    #|> put_flash(:error, "Admin authentication required")
    #|> redirect(to: session_path(conn, :new))
  #end

end
