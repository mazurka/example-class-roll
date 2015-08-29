defmodule ClassRoll.Service.Member do
  def list do
    {:ok, 1..16}
  end

  def list_by_class(class_id) do
    {:ok, 1..15}
  end

  def list_by_class(class_id, date_id) do
    {:ok, 1..15}
  end

  def get(member_id) do
    {:ok, %{id: member_id, name: "brandon"}}
  end
end