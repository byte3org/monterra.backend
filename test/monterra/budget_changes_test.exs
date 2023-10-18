defmodule Monterra.BudgetChangesTest do
  use Monterra.DataCase

  alias Monterra.BudgetChanges

  describe "budget_changes" do
    alias Monterra.BudgetChanges.BudgetChange

    import Monterra.BudgetChangesFixtures

    @invalid_attrs %{new_amount: nil, prev_amount: nil, change_description: nil}

    test "list_budget_changes/0 returns all budget_changes" do
      budget_change = budget_change_fixture()
      assert BudgetChanges.list_budget_changes() == [budget_change]
    end

    test "get_budget_change!/1 returns the budget_change with given id" do
      budget_change = budget_change_fixture()
      assert BudgetChanges.get_budget_change!(budget_change.id) == budget_change
    end

    test "create_budget_change/1 with valid data creates a budget_change" do
      valid_attrs = %{new_amount: 120.5, prev_amount: 120.5, change_description: "some change_description"}

      assert {:ok, %BudgetChange{} = budget_change} = BudgetChanges.create_budget_change(valid_attrs)
      assert budget_change.new_amount == 120.5
      assert budget_change.prev_amount == 120.5
      assert budget_change.change_description == "some change_description"
    end

    test "create_budget_change/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BudgetChanges.create_budget_change(@invalid_attrs)
    end

    test "update_budget_change/2 with valid data updates the budget_change" do
      budget_change = budget_change_fixture()
      update_attrs = %{new_amount: 456.7, prev_amount: 456.7, change_description: "some updated change_description"}

      assert {:ok, %BudgetChange{} = budget_change} = BudgetChanges.update_budget_change(budget_change, update_attrs)
      assert budget_change.new_amount == 456.7
      assert budget_change.prev_amount == 456.7
      assert budget_change.change_description == "some updated change_description"
    end

    test "update_budget_change/2 with invalid data returns error changeset" do
      budget_change = budget_change_fixture()
      assert {:error, %Ecto.Changeset{}} = BudgetChanges.update_budget_change(budget_change, @invalid_attrs)
      assert budget_change == BudgetChanges.get_budget_change!(budget_change.id)
    end

    test "delete_budget_change/1 deletes the budget_change" do
      budget_change = budget_change_fixture()
      assert {:ok, %BudgetChange{}} = BudgetChanges.delete_budget_change(budget_change)
      assert_raise Ecto.NoResultsError, fn -> BudgetChanges.get_budget_change!(budget_change.id) end
    end

    test "change_budget_change/1 returns a budget_change changeset" do
      budget_change = budget_change_fixture()
      assert %Ecto.Changeset{} = BudgetChanges.change_budget_change(budget_change)
    end
  end
end
