defmodule Monterra.BudgetsTest do
  use Monterra.DataCase

  alias Monterra.Budgets

  describe "budgets" do
    alias Monterra.Budgets.Budget

    import Monterra.BudgetsFixtures

    @invalid_attrs %{name: nil, sub: nil, amount: nil}

    test "list_budgets/0 returns all budgets" do
      budget = budget_fixture()
      assert Budgets.list_budgets() == [budget]
    end

    test "get_budget!/1 returns the budget with given id" do
      budget = budget_fixture()
      assert Budgets.get_budget!(budget.id) == budget
    end

    test "create_budget/1 with valid data creates a budget" do
      valid_attrs = %{name: "some name", sub: "some sub", amount: 120.5}

      assert {:ok, %Budget{} = budget} = Budgets.create_budget(valid_attrs)
      assert budget.name == "some name"
      assert budget.sub == "some sub"
      assert budget.amount == 120.5
    end

    test "create_budget/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Budgets.create_budget(@invalid_attrs)
    end

    test "update_budget/2 with valid data updates the budget" do
      budget = budget_fixture()
      update_attrs = %{name: "some updated name", sub: "some updated sub", amount: 456.7}

      assert {:ok, %Budget{} = budget} = Budgets.update_budget(budget, update_attrs)
      assert budget.name == "some updated name"
      assert budget.sub == "some updated sub"
      assert budget.amount == 456.7
    end

    test "update_budget/2 with invalid data returns error changeset" do
      budget = budget_fixture()
      assert {:error, %Ecto.Changeset{}} = Budgets.update_budget(budget, @invalid_attrs)
      assert budget == Budgets.get_budget!(budget.id)
    end

    test "delete_budget/1 deletes the budget" do
      budget = budget_fixture()
      assert {:ok, %Budget{}} = Budgets.delete_budget(budget)
      assert_raise Ecto.NoResultsError, fn -> Budgets.get_budget!(budget.id) end
    end

    test "change_budget/1 returns a budget changeset" do
      budget = budget_fixture()
      assert %Ecto.Changeset{} = Budgets.change_budget(budget)
    end
  end
end
