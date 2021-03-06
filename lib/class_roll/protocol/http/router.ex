defmodule ClassRoll.Protocol.HTTP.Router do
  use Mazurka.Protocol.HTTP.Router
  use Mazurka.Mediatype.Hyperjson.Hyperpath
  use ClassRoll.Dispatch

  plug :match
  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger
  end
  plug Plug.Parsers, parsers: [Plug.Parsers.JSON,
                               Plug.Parsers.URLENCODED],
                     json_decoder: Poison
  plug :dispatch

  get     "/",                                                  ClassRoll.Resource.Root
  get     "/classes",                                           ClassRoll.Resource.Classes
  post    "/classes",                                           ClassRoll.Resource.Classes.Create
  get     "/classes/:class",                                    ClassRoll.Resource.Classes.Read
  post    "/classes/:class",                                    ClassRoll.Resource.Classes.Update
  get     "/classes/:class/members",                            ClassRoll.Resource.Classes.Members
  post    "/classes/:class/members",                            ClassRoll.Resource.Classes.Members.Create
  get     "/classes/:class/members/:member/attendance",         ClassRoll.Resource.Classes.Members.Attendance
  get     "/classes/:class/dates",                              ClassRoll.Resource.Classes.Dates
  post    "/classes/:class/dates",                              ClassRoll.Resource.Classes.Dates.Create
  get     "/classes/:class/dates/:date",                        ClassRoll.Resource.Classes.Dates.Read
  get     "/classes/:class/dates/:date/members/:member",        ClassRoll.Resource.Classes.Dates.Attendance
  post    "/classes/:class/dates/:date/members/:member",        ClassRoll.Resource.Classes.Dates.Attendance.Update
  get     "/members/:member",                                   ClassRoll.Resource.Members.Read
  post    "/members/:member",                                   ClassRoll.Resource.Members.Update
  get     "/members/:member/classes",                           ClassRoll.Resource.Members.Classes
  match   _,                                                    ClassRoll.Resource.Error.NotFound
end
