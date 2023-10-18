defmodule Monterra.BillTypes.BillType do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bill_types" do
    field :name, :string
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(bill_type, attrs) do
    bill_type
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
