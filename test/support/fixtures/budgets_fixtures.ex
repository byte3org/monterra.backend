defmodule Monterra.BudgetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Monterra.Budgets` context.
  """

  @doc """
  Generate a budget.
  """
  def budget_fixture(attrs \\ %{}) do
    {:ok, budget} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        name: "some name",
        sub: "some sub"
      })
      |> Monterra.Budgets.create_budget()

    budget
  end
end
