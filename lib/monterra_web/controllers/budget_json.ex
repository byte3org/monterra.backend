defmodule MonterraWeb.BudgetJSON do
  alias Monterra.Budgets.Budget

  @doc """
  Renders a list of budgets.
  """
  def index(%{budgets: budgets}) do
    %{data: for(budget <- budgets, do: data(budget))}
  end

  @doc """
  Renders a single budget.
  """
  def show(%{budget: budget}) do
    %{data: data(budget)}
  end

  defp data(%Budget{} = budget) do
    %{
      id: budget.id,
      sub: budget.sub,
      amount: budget.amount,
      name: budget.name
    }
  end
end
