defmodule ClassRoll.DB.Model do
  defmacro __using__(_) do
    quote do
      use Mazurka.Model
      alias ClassRoll.DB.Postgres, as: DB
      import Ecto.Query, only: [from: 2]

      @primary_key {:id, :binary_id, autogenerate: true}
      @foreign_key_type :binary_id
    end
  end
end
