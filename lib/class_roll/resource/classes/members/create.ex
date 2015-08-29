defmodule ClassRoll.Resource.Classes.Members.Create do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  let members = Member.list_outside_of_class(class)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      member = if Input.get("member") do
        Input.get("member")
        |> Member.get()
      else
        Member.create(%{name: Input.get("name")})
      end
      Class.associate(class, member)
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