defmodule MonterraWeb.BillJSON do
  alias Monterra.Bills.Bill

  @doc """
  Renders a list of bills.
  """
  def index(%{bills: bills}) do
    %{data: for(bill <- bills, do: data(bill))}
  end

  @doc """
  Renders a single bill.
  """
  def show(%{bill: bill}) do
    %{data: data(bill)}
  end

  defp data(%Bill{} = bill) do
    %{
      id: bill.id,
      bill_url: bill.bill_url,
      bill_extracts_id: bill.bill_extracts_id,
      issued_by: bill.issued_by
    }
  end
end
