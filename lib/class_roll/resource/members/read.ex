defmodule ClassRoll.Resource.Members.Read do
  use Mazurka.Resource

  param class do
    Class.get(value)
  end

  param member do
    Member.get(value)
  end

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "name" => member.name,
        "classes" => link_to(ClassRoll.Resource.Members.Classes, member: member),
        "update" => link_to(ClassRoll.Resource.Members.Update, member: member),
      }
    end
  end
end