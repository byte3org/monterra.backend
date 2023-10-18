defmodule Monterra.BudgetChanges.BudgetChange do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "budget_changes" do
    field :new_amount, :float
    field :prev_amount, :float
    field :change_description, :string
    field :budget_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(budget_change, attrs) do
    budget_change
    |> cast(attrs, [:new_amount, :prev_amount, :change_description])
    |> validate_required([:new_amount, :prev_amount, :change_description])
  end
end
