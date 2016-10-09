defmodule Ppush.UploadController do
  use Ppush.Web, :controller
  use Guardian.Phoenix.Controller
  alias Ppush.User


  def create(conn, %{"file" => file}, current_user, _claims) when current_user != nil do
    IO.inspect(current_user)
    IO.inspect(file)
  end

  def create(conn,  %{"file" => file}, current_user, _claims) when current_user == nil do
    file = params.file
  end
end
