defmodule ClassRoll.Resource.Classes.Update do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      Class.update(class, %{name: Input.get("name")})
      transition_to(ClassRoll.Resource.Classes.Read, class: class)
    end

    affordance do
      %{
        "input" => %{
          "name" => %{
            "type" => "text",
            "required" => true
          }
        }
      }
    end
  end
end
