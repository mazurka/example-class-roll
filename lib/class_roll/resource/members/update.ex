defmodule ClassRoll.Resource.Members.Update do
  use Mazurka.Resource

  param member do
    Member.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      Member.create(%{name: Input.get("name")})
      transition_to(ClassRoll.Resource.Members.Read, member: member)
    end

    affordance do
      %{
        "input" => %{
          "name" => %{
            "type" => "text",
            "value" => member.name
          },
        }
      }
    end
  end
end
