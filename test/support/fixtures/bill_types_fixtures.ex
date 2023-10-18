defmodule Monterra.BillTypesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Monterra.BillTypes` context.
  """

  @doc """
  Generate a bill_type.
  """
  def bill_type_fixture(attrs \\ %{}) do
    {:ok, bill_type} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Monterra.BillTypes.create_bill_type()

    bill_type
  end
end
