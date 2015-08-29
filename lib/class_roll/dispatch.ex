defmodule ClassRoll.Dispatch do
  use Mazurka.Dispatch
  alias ClassRoll.Service

  service Attendee, Service.Attendee
  service Class, Service.Class
  service Date, Service.Date
end