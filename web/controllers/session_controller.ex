defmodule Ppush.SessionController do
  use Ppush.Web, :controller

  #alias Ppush.User
  alias Ppush.Session

  def new(conn, _params) do
   render conn
  end

  def create(conn, %{"session" => session_params}) do
    case Session.create(session_params["email"], session_params["password"]) do
      {:ok, user, :user} ->
        conn
        |> put_flash(:info, "You are logged in as user")
        |> Guardian.Plug.sign_in(user, :access)
        |> redirect(to: "/")
      {:ok, user, :admin} ->
        conn
        |> put_flash(:info, "You are logged in as admin")
        |> Guardian.Plug.sign_in(user, :access)
        |> Guardian.Plug.sign_in(user, :access, key: :admin) #TODO: added perms to db and set it by Guardian perms perms: %{default: Guardian.Permissions.max})
        |> redirect(to: "/")
      {:error, _} ->
        conn
        |> put_flash(:info, gettext("User or password is invalid"))
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    Guardian.Plug.sign_out(conn)
    |> put_flash(:info, gettext("Logged out successfully."))
    |> redirect(to: "/")
  end
end
