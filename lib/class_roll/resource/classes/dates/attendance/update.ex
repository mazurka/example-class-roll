defmodule ClassRoll.Resource.Classes.Dates.Attendance.Update do
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

  let attendance = Attendance.get(class.id, date.id, member.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      Attendance.update(class.id, date.id, member.id, %{present: Input.get("_present")})
      transition_to(ClassRoll.Resource.Classes.Dates.Attendance, class: class, date: date, member: member)
    end

    affordance do
      %{
        "input" => %{
          "_present" => %{
            "type" => "hidden",
            "value" => attendance.present,
          }
        }
      }
    end
  end
end