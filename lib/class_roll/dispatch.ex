defmodule ClassRoll.Dispatch do
  use Mazurka.Dispatch
  alias ClassRoll.Service

  service Attendance, Service.Attendance
  service Class, Service.Class
  service Date, Service.Date
  service Member, Service.Member
end