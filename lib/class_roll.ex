defmodule ClassRoll do
  use Application
  require Logger

  def start(_type, _args) do
    if Mix.env == :dev do
      dev()
    end
    ClassRoll.Protocol.HTTP.start()
    ClassRoll.Supervisor.start_link()
  end

  def dev do
    :rl.cmd(['src/**/*.erl', 'mix compile.erlang'])
    :rl.cmd(['lib/**/*.ex', 'mix compile'])
    :rl.error_handler(fn({ {exception = %{:__struct__ => name}, stacktrace }, _}, _file) ->
      Logger.error("** (#{name}) #{Exception.message(exception)}")
      Logger.error(Exception.format_stacktrace(stacktrace))
    end)
  end
end
