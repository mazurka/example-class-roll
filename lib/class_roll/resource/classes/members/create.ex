defmodule ClassRoll.Resource.Classes.Members.Create do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  let members = Member.list_outside_of_class(class.id)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      if Input.get("member") do
        Class.associate(class.id, Input.get("member"))
      else
        member = Member.create(%{name: Input.get("name")})
      end
      transition_to(ClassRoll.Resource.Classes.Members, class: class)
    end

    affordance do
      %{
        "input" => %{
          "member" => %{
            "type" => "select",
            "options" => for member <- members do
              %{
                "label" => member.name,
                "value" => member.id
              }
            end
          },
          "name" => %{
            "type" => "text"
          },
        }
      }
    end
  end
end