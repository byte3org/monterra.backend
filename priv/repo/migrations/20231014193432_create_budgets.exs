defmodule Monterra.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :sub, :string
      add :amount, :float
      add :name, :string

      timestamps()
    end
  end
end
