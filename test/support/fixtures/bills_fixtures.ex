defmodule Monterra.BillsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Monterra.Bills` context.
  """

  @doc """
  Generate a bill.
  """
  def bill_fixture(attrs \\ %{}) do
    {:ok, bill} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        bill_url: "some bill_url",
        issued_by: "some issued_by"
      })
      |> Monterra.Bills.create_bill()

    bill
  end

  @doc """
  Generate a bill.
  """
  def bill_fixture(attrs \\ %{}) do
    {:ok, bill} =
      attrs
      |> Enum.into(%{
        bill_extracts_id: "some bill_extracts_id",
        bill_url: "some bill_url",
        issued_by: "some issued_by"
      })
      |> Monterra.Bills.create_bill()

    bill
  end
end
