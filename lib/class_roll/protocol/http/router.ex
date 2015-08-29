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

  get     "/",                          ClassRoll.Resource.Root

  match   _,                            ClassRoll.Resource.Error.NotFound
end