defmodule ClassRoll.Dispatch do
  use Mazurka.Dispatch
  alias ClassRoll.Service

  service Greeting.world/0, Service.Greeting.world
end