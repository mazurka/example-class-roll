defmodule ClassRoll.Service.Class do
  use ClassRoll.DB.Model

  schema "classes" do
    field     :name,    :string
    timestamps
    field     :deleted_at,     Ecto.DateTime
    has_many  :members,        ClassRoll.Service.Member
  end

  @required_fields ~w(name)
  @optional_fields ~w()

  def list do
    query = from c in __MODULE__,
          where: is_nil(c.deleted_at),
         select: c,
       order_by: [desc: c.inserted_at]

    {:ok, DB.all(query)}
  end

  def get(id, opts \\ []) do
    get(DB, id, opts)
  end

  def list_by_member(member) do
    {:ok, 1..4}
  end

  def create(params) do
    %__MODULE__{}
    |> changeset(params)
    |> DB.insert()
  end

  def associate(class, member) do
    {:ok, true}
  end

  def update(class, params) do
    class
    |> changeset(params)
    |> DB.update()
  end

  def changeset(class, params \\ :empty) do
    class
    |> cast(params, @required_fields, @optional_fields)
  end
end
