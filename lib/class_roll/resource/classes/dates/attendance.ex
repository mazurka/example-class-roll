defmodule ClassRoll.Resource.Classes.Dates.Attendance do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  param date do
    Date.get(value)
  end

  param member  do
    Member.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "member" => link_to(ClassRoll.Resource.Members.Read, member: member),
        "date" => link_to(ClassRoll.Resource.Classes.Dates.Read, class: class, date: date),
        "class" => link_to(ClassRoll.Resource.Classes.Read, class: class),
      }
    end
  end

end