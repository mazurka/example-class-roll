defmodule ClassRoll.Service.Attendee do
  def list(class_id) do
    {:ok, 1..15}
  end

  def list(class_id, date_id) do
    {:ok, 1..15}
  end

  def get(attendee_id) do
    {:ok, %{id: attendee_id, name: "brandon"}}
  end
end