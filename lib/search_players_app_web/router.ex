defmodule SearchPlayersAppWeb.Router do
  use SearchPlayersAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SearchPlayersAppWeb do
    pipe_through :api

    resources "/players", PlayerController, except: [:new, :edit]
    resources "/teams", TeamController, except: [:new, :edit]
  end
end
