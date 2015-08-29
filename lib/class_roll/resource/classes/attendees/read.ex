defmodule ClassRoll.Resource.Classes.Attendees.Read do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  param attendee do
    Attendee.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "name" => attendee.name,
        "class" => link_to(ClassRoll.Resource.Classes.Read, class: class),
        "attendance" => link_to(ClassRoll.Resource.Classes.Attendees.Attendance, class: class, attendee: attendee),
      }
    end
  end
end