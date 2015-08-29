defmodule ExampleClassRoll.Protocol.HTTP.Router do
  use Mazurka.Protocol.HTTP.Router
  use Mazurka.Mediatype.Hyperjson.Hyperpath
  use ExampleClassRoll.Dispatch

  plug :match
  if Mix.env == :dev do
    use Plug.Debugger
    plug Plug.Logger
  end
  plug :dispatch

  get     "/",                          ExampleClassRoll.Resource.Root

  match   _,                            ExampleClassRoll.Resource.Error.NotFound
end