defmodule ClassRoll.Resource.Classes.Attendees.Attendance do
  use Mazurka.Resource

  param attendee do
    Attendee.get(value)
  end

  param class do
    Class.get(value)
  end

  let dates = Date.get_by_attendee(attendee.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for date <- dates do
          link_to(ClassRoll.Resource.Classes.Dates.Read, class: class, date: date)
        end
      }
    end
  end
end