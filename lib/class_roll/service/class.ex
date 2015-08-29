defmodule ClassRoll.Service.Class do
  def list do
    {:ok, 1..15}
  end

  def get(id) do
    {:ok, %{id: id, name: "foobar"}}
  end

  def list_by_member(id) do
    {:ok, 1..4}
  end

  def create(params) do
    {:ok, %{id: 134}}
  end

  def associate(class_id, member_id) do
    {:ok, true}
  end
end