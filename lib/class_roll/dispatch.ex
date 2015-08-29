defmodule ClassRoll.Dispatch do
  use Mazurka.Dispatch
  alias ClassRoll.Service

  service Class, Service.Class
end