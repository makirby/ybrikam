defmodule Ybrikam.Router do
  use Ybrikam.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Ybrikam do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController do
      resources "/posts", PostController do # only: [:index, :show]
        resources "/comments", CommentController # except: [:delete]
      end
    end

    resources "/reviews", ReviewController

    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
  end

  scope "/admin", Ybrikam.Admin, as: :admin do 
    pipe_through :browser

    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end

  # Other scopes may use custom stacks.
  scope "/api", Ybrikam do
    pipe_through :api
  end
end
