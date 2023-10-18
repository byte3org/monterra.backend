defmodule MonterraWeb.BillTypeJSON do
  alias Monterra.BillTypes.BillType

  @doc """
  Renders a list of bill_types.
  """
  def index(%{bill_types: bill_types}) do
    %{data: for(bill_type <- bill_types, do: data(bill_type))}
  end

  @doc """
  Renders a single bill_type.
  """
  def show(%{bill_type: bill_type}) do
    %{data: data(bill_type)}
  end

  defp data(%BillType{} = bill_type) do
    %{
      id: bill_type.id,
      name: bill_type.name,
      description: bill_type.description
    }
  end
end
