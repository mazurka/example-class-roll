defmodule ClassRoll.Resource.Root do
  use Mazurka.Resource

  mediatype Mazurka.Mediatype.Hyperjson do
    action do
      %{
        "classes" => link_to(ClassRoll.Resource.Classes)
      }
    end
  end

  test "should response with a 200" do
    conn = request do
      accept "hyper+json"
    end

    assert conn.status == 200
  end
end