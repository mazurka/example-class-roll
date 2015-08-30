defmodule ClassRoll.DB.Postgres.Migrations.AddClassesTable do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :name, :string, size: 255, null: false
      timestamps
      add :deleted_at, :datetime
    end
  end
end
