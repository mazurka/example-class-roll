defmodule ClassRoll.Resource.Classes.Attendees do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  let attendees = Attendee.list(class.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for attendee <- attendees do
          link_to(ClassRoll.Resource.Classes.Attendees.Read, class: class, attendee: attendee)
        end
      }
    end
  end
end