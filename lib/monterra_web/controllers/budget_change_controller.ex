defmodule MonterraWeb.BudgetChangeController do
  use MonterraWeb, :controller

  alias Monterra.BudgetChanges
  alias Monterra.BudgetChanges.BudgetChange

  action_fallback MonterraWeb.FallbackController

  def index(conn, _params) do
    budget_changes = BudgetChanges.list_budget_changes()
    render(conn, :index, budget_changes: budget_changes)
  end

  def create(conn, %{"budget_change" => budget_change_params}) do
    with {:ok, %BudgetChange{} = budget_change} <- BudgetChanges.create_budget_change(budget_change_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/budget_changes/#{budget_change}")
      |> render(:show, budget_change: budget_change)
    end
  end

  def show(conn, %{"id" => id}) do
    budget_change = BudgetChanges.get_budget_change!(id)
    render(conn, :show, budget_change: budget_change)
  end

  def update(conn, %{"id" => id, "budget_change" => budget_change_params}) do
    budget_change = BudgetChanges.get_budget_change!(id)

    with {:ok, %BudgetChange{} = budget_change} <- BudgetChanges.update_budget_change(budget_change, budget_change_params) do
      render(conn, :show, budget_change: budget_change)
    end
  end

  def delete(conn, %{"id" => id}) do
    budget_change = BudgetChanges.get_budget_change!(id)

    with {:ok, %BudgetChange{}} <- BudgetChanges.delete_budget_change(budget_change) do
      send_resp(conn, :no_content, "")
    end
  end
end
