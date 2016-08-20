defmodule Ppush.PageController do
  use Ppush.Web, :controller
  use Guardian.Phoenix.Controller


  def index(conn, _params, current_user, _claims) do
    render conn, "index.html", current_user: current_user
  end

end
