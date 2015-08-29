defmodule ClassRoll.Resource.Classes.Create do
  use Mazurka.Resource

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      class = Class.create(%{name: Input.get("name")})
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