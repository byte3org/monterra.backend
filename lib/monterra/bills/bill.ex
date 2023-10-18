defmodule Monterra.Bills.Bill do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "bills" do
    field :bill_url, :string
    field :bill_extracts_id, :string
    field :issued_by, :string
    field :bill_type_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(bill, attrs) do
    bill
    |> cast(attrs, [:bill_url, :bill_extracts_id, :issued_by])
    |> validate_required([:bill_url, :bill_extracts_id, :issued_by])
  end
end
