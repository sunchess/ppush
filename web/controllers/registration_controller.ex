defmodule Ppush.RegistrationController do
  use Ppush.Web, :controller

  alias Ppush.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)

    case Ppush.Registration.create(changeset, Ppush.Repo) do
      {:ok, changeset} ->
        conn
        |> put_flash(:info, gettext("Your account was created"))
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:info, gettext("Unable to create account"))
        |> render("new.html", changeset: changeset)
    end
  end
end
