defmodule Ppush.PageController do
  use Ppush.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
