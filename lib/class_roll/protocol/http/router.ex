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
  get     "/classes/:class/members",                            ClassRoll.Resource.Classes.Members
  get     "/classes/:class/members/:member/attendance",         ClassRoll.Resource.Classes.Members.Attendance
  get     "/classes/:class/dates",                              ClassRoll.Resource.Classes.Dates
  get     "/classes/:class/dates/:date",                        ClassRoll.Resource.Classes.Dates.Read
  get     "/classes/:class/dates/:date/members/:member",        ClassRoll.Resource.Classes.Dates.Attendance
  get     "/members/:member",                                   ClassRoll.Resource.Members.Read
  match   _,                                                    ClassRoll.Resource.Error.NotFound
end