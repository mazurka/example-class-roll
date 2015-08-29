defmodule ExampleClassRoll.Dispatch do
  use Mazurka.Dispatch
  alias ExampleClassRoll.Service

  service Greeting.world/0, Service.Greeting.world
end