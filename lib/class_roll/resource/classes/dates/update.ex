defmodule ClassRoll.Resource.Classes.Dates.Update do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  param date do
    Date.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      Date.update(date, %{"date" => Input.get("date")} )
      transition_to(ClassRoll.Resource.Classes.Dates.Read, class: class, date: date)
    end

    affordance do
      %{
        "input" => %{
          "date" => %{
            "type" => "date",
            "required" => true
          }
        }
      }
    end
  end
end