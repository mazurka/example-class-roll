defmodule ClassRoll.Resource.Classes.Members do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  let members = Member.list_by_class(class)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for member <- members do
          link_to(ClassRoll.Resource.Members.Read, member: member)
        end,
        "create" => link_to(ClassRoll.Resource.Classes.Members.Create, class: class)
      }
    end
  end
end