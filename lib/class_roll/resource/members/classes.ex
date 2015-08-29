defmodule ClassRoll.Resource.Members.Classes do
  use Mazurka.Resource

  param member do
    Member.get(value)
  end

  let classes = Class.list_by_member(member)

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for class <- classes do
          link_to(ClassRoll.Resource.Classes.Read, class: class)
        end
      }
    end
  end
end