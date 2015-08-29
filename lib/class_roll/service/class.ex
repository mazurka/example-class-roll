defmodule ClassRoll.Service.Class do
  use Mazurka.Model

  schema "classes" do
    field     :name,    :string
  end

  def list do
    {:ok, 1..15}
  end

  def get(id) do
    {:ok, %{id: id, name: "foobar"}}
  end

  def list_by_member(member) do
    {:ok, 1..4}
  end

  def create(params) do
    {:ok, %{id: 134}}
  end

  def associate(class, member) do
    {:ok, true}
  end

  def update(class, params) do
    {:ok, true}
  end
end
