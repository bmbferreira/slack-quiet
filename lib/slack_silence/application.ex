defmodule SlackQuiet.Application do
  @moduledoc false

  use Application

  # See https://hexdocs.pm/elixir/Application.html
  ## TODO !!!!!
  ## FIXME !!!!
  # for more information on OTP Applications
  def start(_type, _args) do
    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      SlackQuietWeb.Endpoint,
      SlackQuiet.LastUsageRegistry
      # Start your own worker by calling: SlackQuiet.Worker.start_link(arg1, arg2, arg3)
      # worker(SlackQuiet.Worker, [arg1, arg2, arg3]),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SlackQuiet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    SlackQuietWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
