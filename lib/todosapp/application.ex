defmodule Todosapp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Todosapp.Repo,
      # Start the Telemetry supervisor
      TodosappWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Todosapp.PubSub},
      # Start the Endpoint (http/https)
      TodosappWeb.Endpoint
      # Start a worker by calling: Todosapp.Worker.start_link(arg)
      # {Todosapp.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Todosapp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    TodosappWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
