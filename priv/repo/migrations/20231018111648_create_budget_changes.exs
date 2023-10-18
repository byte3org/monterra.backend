defmodule Monterra.Repo.Migrations.CreateBudgetChanges do
  use Ecto.Migration

  def change do
    create table(:budget_changes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :new_amount, :float
      add :prev_amount, :float
      add :change_description, :string
      add :budget_id, references(:budget, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:budget_changes, [:budget_id])
  end
end
