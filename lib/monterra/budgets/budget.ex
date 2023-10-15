defmodule Monterra.Budgets.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "budgets" do
    field :name, :string
    field :sub, :string
    field :amount, :float

    timestamps()
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:sub, :amount, :name])
    |> validate_required([:sub, :amount, :name])
  end
end
