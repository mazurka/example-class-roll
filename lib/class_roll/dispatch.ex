defmodule ClassRoll.Dispatch do
  use Mazurka.Dispatch
  alias ClassRoll.Service

  service Class, Service.Class
  service Date, Service.Date
  service Member, Service.Member
end