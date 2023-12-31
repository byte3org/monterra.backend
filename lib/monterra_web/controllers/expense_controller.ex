defmodule MonterraWeb.ExpenseController do
  use MonterraWeb, :controller

  alias Monterra.Expenses
  alias Monterra.Expenses.Expense

  action_fallback MonterraWeb.FallbackController

  def index(conn, _params) do
    expenses = Expenses.list_expenses()
    render(conn, :index, expenses: expenses)
  end

  def create(conn, %{"expense" => expense_params}) do
    with {:ok, %Expense{} = expense} <- Expenses.create_expense(expense_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/expenses/#{expense}")
      |> render(:show, expense: expense)
    end
  end

  def show(conn, %{"id" => id}) do
    expense = Expenses.get_expense!(id)
    render(conn, :show, expense: expense)
  end

  def update(conn, %{"id" => id, "expense" => expense_params}) do
    expense = Expenses.get_expense!(id)

    with {:ok, %Expense{} = expense} <- Expenses.update_expense(expense, expense_params) do
      render(conn, :show, expense: expense)
    end
  end

  def delete(conn, %{"id" => id}) do
    expense = Expenses.get_expense!(id)

    with {:ok, %Expense{}} <- Expenses.delete_expense(expense) do
      send_resp(conn, :no_content, "")
    end
  end
end
