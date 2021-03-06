alias ClassRoll.Resource.Classes.Dates

defmodule Dates.Create do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      date = Date.create(class, %{"date" => Input.get("date")} )
      transition_to(Dates.Read, class: class, date: date)
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