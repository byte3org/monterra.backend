defmodule MonterraWeb.BudgetChangeControllerTest do
  use MonterraWeb.ConnCase

  import Monterra.BudgetChangesFixtures

  alias Monterra.BudgetChanges.BudgetChange

  @create_attrs %{
    new_amount: 120.5,
    prev_amount: 120.5,
    change_description: "some change_description"
  }
  @update_attrs %{
    new_amount: 456.7,
    prev_amount: 456.7,
    change_description: "some updated change_description"
  }
  @invalid_attrs %{new_amount: nil, prev_amount: nil, change_description: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all budget_changes", %{conn: conn} do
      conn = get(conn, ~p"/api/budget_changes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create budget_change" do
    test "renders budget_change when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/budget_changes", budget_change: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/budget_changes/#{id}")

      assert %{
               "id" => ^id,
               "change_description" => "some change_description",
               "new_amount" => 120.5,
               "prev_amount" => 120.5
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/budget_changes", budget_change: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update budget_change" do
    setup [:create_budget_change]

    test "renders budget_change when data is valid", %{conn: conn, budget_change: %BudgetChange{id: id} = budget_change} do
      conn = put(conn, ~p"/api/budget_changes/#{budget_change}", budget_change: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/budget_changes/#{id}")

      assert %{
               "id" => ^id,
               "change_description" => "some updated change_description",
               "new_amount" => 456.7,
               "prev_amount" => 456.7
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, budget_change: budget_change} do
      conn = put(conn, ~p"/api/budget_changes/#{budget_change}", budget_change: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete budget_change" do
    setup [:create_budget_change]

    test "deletes chosen budget_change", %{conn: conn, budget_change: budget_change} do
      conn = delete(conn, ~p"/api/budget_changes/#{budget_change}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/budget_changes/#{budget_change}")
      end
    end
  end

  defp create_budget_change(_) do
    budget_change = budget_change_fixture()
    %{budget_change: budget_change}
  end
end
