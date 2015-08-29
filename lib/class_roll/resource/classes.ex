defmodule ClassRoll.Resource.Classes do
  use Mazurka.Resource

  let classes = Class.list()

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "collection" => for class <- classes do
          link_to(ClassRoll.Resource.Classes.Read, class: class)
        end,
        "create" => link_to(ClassRoll.Resource.Classes.Create),
      }
    end
  end
end