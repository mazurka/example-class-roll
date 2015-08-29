defmodule ClassRoll.Resource.Classes.Read do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "name" => class.name,
        "dates" => link_to(ClassRoll.Resource.Classes.Dates, class: class),
        "attendees" => link_to(ClassRoll.Resource.Classes.Attendees, class: class)
      }
    end
  end
end