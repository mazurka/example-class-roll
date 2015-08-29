defmodule ClassRoll.Resource.Classes.Members.Attendance do
  use Mazurka.Resource

  param member do
    Member.get(value)
  end

  param class do
    Class.get(value)
  end

  let dates = Date.list_by_member(class, member)

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