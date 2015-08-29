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

  let attendance = Attendance.get(class, date, member)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "member" => link_to(ClassRoll.Resource.Members.Read, member: member),
        "date" => link_to(ClassRoll.Resource.Classes.Dates.Read, class: class, date: date),
        "class" => link_to(ClassRoll.Resource.Classes.Read, class: class),
        "present" => %{
          "data" => attendance.present,
          "toggle" => link_to(ClassRoll.Resource.Classes.Dates.Attendance.Update, class: class, date: date, member: member),
        }
      }
    end
  end

end