defmodule ClassRoll.Protocol.HTTP.Router do
  use Mazurka.Protocol.HTTP.Router
  use Mazurka.Mediatype.Hyperjson.Hyperpath
  use ClassRoll.Dispatch

  plug :match
  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger
  end
  plug :dispatch

  get     "/",                                                  ClassRoll.Resource.Root
  get     "/classes",                                           ClassRoll.Resource.Classes
  get     "/classes/:class",                                    ClassRoll.Resource.Classes.Read
  get     "/classes/:class/attendees",                          ClassRoll.Resource.Classes.Attendees
  get     "/classes/:class/attendees/:attendee",                ClassRoll.Resource.Classes.Attendees.Read
  get     "/classes/:class/attendees/:attendee/attendance",     ClassRoll.Resource.Classes.Attendees.Attendance
  get     "/classes/:class/dates",                              ClassRoll.Resource.Classes.Dates
  get     "/classes/:class/dates/:date",                        ClassRoll.Resource.Classes.Dates.Read
  match   _,                                                    ClassRoll.Resource.Error.NotFound
end