defmodule Ppush.SessionController do
  use Ppush.Web, :controller

  #alias Ppush.User
  alias Ppush.Session

  def new(conn, _params) do
   render conn
  end

  def create(conn, %{"session" => session_params}) do
    case Session.create(session_params["email"], session_params["password"]) do
      {:ok, user} ->
        conn
        |> put_flash(:info, gettext("Your account was created"))
        |> Guardian.Plug.sign_in(user, :token)
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
