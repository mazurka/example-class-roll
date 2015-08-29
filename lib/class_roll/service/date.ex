defmodule ClassRoll.Service.Date do
  def list(class) do
    {:ok, 1..5}
  end

  def get(id) do
    {:ok, %{id: id, date: "2015-08-22T07:18:52Z"}}
  end

  def list_by_member(class, member) do
    {:ok, 1..15}
  end

  def create(class, date) do
    {:ok, %{id: 1524, date: "2015-08-22T07:18:52Z"}}
  end

  def update(date, params) do
    {:ok, true}
  end
end