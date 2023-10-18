defmodule Monterra.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, :string
      add :amount, :float
      add :budget_id, references(:budget, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:expenses, [:budget_id])
  end
end
