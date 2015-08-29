defmodule ClassRoll.Service.Attendance do

  def get(class, date, member) do
    {:ok, %{present: true}}
  end

  def update(class, date, member, params) do
    {:ok, true}
  end
end