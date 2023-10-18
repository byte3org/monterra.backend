defmodule MonterraWeb.BudgetChangeJSON do
  alias Monterra.BudgetChanges.BudgetChange

  @doc """
  Renders a list of budget_changes.
  """
  def index(%{budget_changes: budget_changes}) do
    %{data: for(budget_change <- budget_changes, do: data(budget_change))}
  end

  @doc """
  Renders a single budget_change.
  """
  def show(%{budget_change: budget_change}) do
    %{data: data(budget_change)}
  end

  defp data(%BudgetChange{} = budget_change) do
    %{
      id: budget_change.id,
      new_amount: budget_change.new_amount,
      prev_amount: budget_change.prev_amount,
      change_description: budget_change.change_description
    }
  end
end
