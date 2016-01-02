defmodule RethinkExample.PageController do
  use RethinkExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
