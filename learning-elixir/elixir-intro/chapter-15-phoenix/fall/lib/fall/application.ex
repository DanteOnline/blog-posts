defmodule Fall.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FallWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:fall, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Fall.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Fall.Finch},
      # Start a worker by calling: Fall.Worker.start_link(arg)
      # {Fall.Worker, arg},
      # Start to serve requests, typically the last entry
      FallWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Fall.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FallWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
