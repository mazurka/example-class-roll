defmodule ClassRoll.Resource.Classes.Dates.Read do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  param date do
    Date.get(value)
  end

  let members = Member.list_by_class(class, date)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "date" => date.date,
        "class" => link_to(ClassRoll.Resource.Classes.Read, class: class),
        "members" => for member <- members do
          link_to(ClassRoll.Resource.Classes.Dates.Attendance, class: class, date: date, member: member)
        end
      }
    end
  end
end