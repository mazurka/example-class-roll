defmodule ClassRoll.Service.Class do
  use Mazurka.Model
  alias ClassRoll.DB.Postgres, as: DB

  schema "classes" do
    field     :name,    :string
    timestamps
    field     :deleted_at,     Ecto.DateTime
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def list do
    {:ok, 1..15}
  end

  def get(id, opts \\ []) do
    get(ClassRoll.DB.Postgres, id, opts)
  end

  def list_by_member(member) do
    {:ok, 1..4}
  end

  def create(params) do
    %__MODULE__{}
    |> changeset(params)
    |> DB.insert
  end

  def associate(class, member) do
    {:ok, true}
  end

  def update(class, params) do
    {:ok, true}
  end

  def changeset(class, params \\ :empty) do
    class
    |> cast(params, @required_fields, @optional_fields)
  end
end
