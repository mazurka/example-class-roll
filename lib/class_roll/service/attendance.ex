defmodule ClassRoll.Service.Attendance do

  def get(class_id, date_id, member_id) do
    {:ok, %{present: true}}
  end

  def update(class_id, date_id, member_id, params) do
    {:ok, true}
  end
end