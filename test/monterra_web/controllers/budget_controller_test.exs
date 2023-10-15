defmodule MonterraWeb.BudgetControllerTest do
  use MonterraWeb.ConnCase

  import Monterra.BudgetsFixtures

  alias Monterra.Budgets.Budget

  @create_attrs %{
    name: "some name",
    sub: "some sub",
    amount: 120.5
  }
  @update_attrs %{
    name: "some updated name",
    sub: "some updated sub",
    amount: 456.7
  }
  @invalid_attrs %{name: nil, sub: nil, amount: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all budgets", %{conn: conn} do
      conn = get(conn, ~p"/api/budgets")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create budget" do
    test "renders budget when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/budgets", budget: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/budgets/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 120.5,
               "name" => "some name",
               "sub" => "some sub"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/budgets", budget: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update budget" do
    setup [:create_budget]

    test "renders budget when data is valid", %{conn: conn, budget: %Budget{id: id} = budget} do
      conn = put(conn, ~p"/api/budgets/#{budget}", budget: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/budgets/#{id}")

      assert %{
               "id" => ^id,
               "amount" => 456.7,
               "name" => "some updated name",
               "sub" => "some updated sub"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, budget: budget} do
      conn = put(conn, ~p"/api/budgets/#{budget}", budget: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete budget" do
    setup [:create_budget]

    test "deletes chosen budget", %{conn: conn, budget: budget} do
      conn = delete(conn, ~p"/api/budgets/#{budget}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/budgets/#{budget}")
      end
    end
  end

  defp create_budget(_) do
    budget = budget_fixture()
    %{budget: budget}
  end
end
