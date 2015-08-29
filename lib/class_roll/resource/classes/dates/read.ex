defmodule ClassRoll.Resource.Classes.Dates.Read do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  param date do
    Date.get(value)
  end

  let attendees = Attendee.list(class.id, date.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "date" => date.date,
        "class" => link_to(ClassRoll.Resource.Classes.Read, class: class),
        "collection" => for attendee <- attendees do
          # link_to(ClassRoll.Resource.Classes.Dates.Attendee, class: class, date: date, attendee: attendee)
        end
      }
    end
  end
end