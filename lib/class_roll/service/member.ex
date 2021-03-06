defmodule ClassRoll.Service.Member do
  def list do
    {:ok, 1..16 |> expand}
  end

  def list_by_class(class) do
    {:ok, 1..15 |> expand}
  end

  def list_by_class(class, date) do
    {:ok, 1..15 |> expand}
  end

  def get(member_id) do
    {:ok, %{id: member_id, name: "brandon"}}
  end

  def list_outside_of_class(class) do
    {:ok, 1..5 |> expand}
  end

  def create(params) do
    {:ok, %{id: 154}}
  end

  def update(member, params) do
    {:ok, true}
  end

  defp expand(range) do
    range |> Enum.map( &(get(&1) |> elem(1) ))
  end
end