defmodule ClassRoll.Service.Date do
  def list(class_id) do
    {:ok, 1..5}
  end

  def get(id) do
    {:ok, %{id: id, date: "2015-08-22T07:18:52Z"}}
  end

  def list_by_member(class_id, member_id) do
    {:ok, 1..15}
  end
end