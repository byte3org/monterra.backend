defmodule Monterra.BudgetChangesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Monterra.BudgetChanges` context.
  """

  @doc """
  Generate a budget_change.
  """
  def budget_change_fixture(attrs \\ %{}) do
    {:ok, budget_change} =
      attrs
      |> Enum.into(%{
        change_description: "some change_description",
        new_amount: 120.5,
        prev_amount: 120.5
      })
      |> Monterra.BudgetChanges.create_budget_change()

    budget_change
  end
end
