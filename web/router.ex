defmodule Ppush.Router do
  use Ppush.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :admin_browser_auth do
    plug Guardian.Plug.VerifySession, key: :admin
    plug Guardian.Plug.LoadResource, key: :admin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Ppush do
    pipe_through [:browser, :browser_auth] # Use the default browser stack

    get "/", PageController, :index
    resources "/registrations", RegistrationController, only: [:new, :create]
    resources "/session", SessionController, only: [:new, :create]
    get "/session/delete", SessionController, :delete, as: :delete_session
  end

  # Other scopes may use custom stacks.
  # scope "/api", Ppush do
  #   pipe_through :api
  # end
end
