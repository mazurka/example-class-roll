defmodule ClassRoll.Resource.Classes.Dates do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  let dates = Date.list(class.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for date <- dates do
          link_to(ClassRoll.Resource.Classes.Dates.Read, class: class, date: date)
        end,
        "create" => link_to(ClassRoll.Resource.Classes.Dates.Create, class: class)
      }
    end
  end
end