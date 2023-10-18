defmodule Monterra.Repo.Migrations.CreateBills do
  use Ecto.Migration

  def change do
    create table(:bills, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :bill_url, :string
      add :amount, :float
      add :issued_by, :string
      add :bill_type_id, references(:bill_types, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:bills, [:bill_type_id])
  end
end
