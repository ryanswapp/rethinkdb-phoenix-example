defmodule RethinkExample do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(RethinkExample.Endpoint, []),
      # Start the Ecto repository
      # worker(RethinkExample.Repo, []),
      worker(RethinkDatabase, [[port: 28015, host: "localhost", db: :rethink_example]]),
      # Here you could define other workers and supervisors as children
      # worker(RethinkExample.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RethinkExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RethinkExample.Endpoint.config_change(changed, removed)
    :ok
  end
end
