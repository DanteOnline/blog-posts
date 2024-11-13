defmodule DropWeb.FallController do
  use DropWeb, :controller

  def welcome(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    choices = ["Earth": 1, "Moon": 2, "Mars": 3]
    render(conn, :index, layout: false, choices: choices)
  end

  def faller(conn, params) do
    choices = ["Earth": 1, "Moon": 2, "Mars": 3]
    speed = 0
    render conn, "faller.html", speed: speed, choices: choices
  end
end
