defmodule ClassRoll.Resource.Classes.Read do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "name" => class.name
      }
    end
  end
end