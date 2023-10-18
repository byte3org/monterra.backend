defmodule MonterraWeb.BillTypeControllerTest do
  use MonterraWeb.ConnCase

  import Monterra.BillTypesFixtures

  alias Monterra.BillTypes.BillType

  @create_attrs %{
    name: "some name",
    description: "some description"
  }
  @update_attrs %{
    name: "some updated name",
    description: "some updated description"
  }
  @invalid_attrs %{name: nil, description: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bill_types", %{conn: conn} do
      conn = get(conn, ~p"/api/bill_types")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bill_type" do
    test "renders bill_type when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/bill_types", bill_type: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/bill_types/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/bill_types", bill_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bill_type" do
    setup [:create_bill_type]

    test "renders bill_type when data is valid", %{conn: conn, bill_type: %BillType{id: id} = bill_type} do
      conn = put(conn, ~p"/api/bill_types/#{bill_type}", bill_type: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/bill_types/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bill_type: bill_type} do
      conn = put(conn, ~p"/api/bill_types/#{bill_type}", bill_type: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bill_type" do
    setup [:create_bill_type]

    test "deletes chosen bill_type", %{conn: conn, bill_type: bill_type} do
      conn = delete(conn, ~p"/api/bill_types/#{bill_type}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/bill_types/#{bill_type}")
      end
    end
  end

  defp create_bill_type(_) do
    bill_type = bill_type_fixture()
    %{bill_type: bill_type}
  end
end
