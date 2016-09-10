defmodule Ppush.Admin.UsersController do
  use Ppush.Web, :controller
  use Guardian.Phoenix.Controller, key: :admin

  alias Ppush.User

  plug Guardian.Plug.EnsureAuthenticated, handler: Ppush.Admin, key: :admin
  plug Guardian.Plug.VerifySession, key: :admin

  def index(conn, params, current_user, _claims) do
    IO.inspect(params)
    {users, kerosene} =
      User
      |> order_by([u], desc: u.id)
      |> Repo.paginate(params, per_page: 10)

    render conn, "index.html", current_user: current_user, users: users, kerosene: kerosene
  end

end
