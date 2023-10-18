defmodule Monterra.ExpensesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Monterra.Expenses` context.
  """

  @doc """
  Generate a expense.
  """
  def expense_fixture(attrs \\ %{}) do
    {:ok, expense} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        description: "some description"
      })
      |> Monterra.Expenses.create_expense()

    expense
  end
end
