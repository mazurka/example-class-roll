defmodule ClassRoll.DB.Postgres.Migrations.AddClassesTable do
  use Ecto.Migration

  def change do
    create table(:classes, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string, size: 255, null: false
      timestamps
      add :deleted_at, :datetime
    end
  end
end
