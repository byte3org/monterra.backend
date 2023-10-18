defmodule MonterraWeb.BillControllerTest do
  use MonterraWeb.ConnCase

  import Monterra.BillsFixtures

  alias Monterra.Bills.Bill

  @create_attrs %{
    bill_url: "some bill_url",
    bill_extracts_id: "some bill_extracts_id",
    issued_by: "some issued_by"
  }
  @update_attrs %{
    bill_url: "some updated bill_url",
    bill_extracts_id: "some updated bill_extracts_id",
    issued_by: "some updated issued_by"
  }
  @invalid_attrs %{bill_url: nil, bill_extracts_id: nil, issued_by: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all bills", %{conn: conn} do
      conn = get(conn, ~p"/api/bills")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create bill" do
    test "renders bill when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/bills", bill: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/bills/#{id}")

      assert %{
               "id" => ^id,
               "bill_extracts_id" => "some bill_extracts_id",
               "bill_url" => "some bill_url",
               "issued_by" => "some issued_by"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/bills", bill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update bill" do
    setup [:create_bill]

    test "renders bill when data is valid", %{conn: conn, bill: %Bill{id: id} = bill} do
      conn = put(conn, ~p"/api/bills/#{bill}", bill: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/bills/#{id}")

      assert %{
               "id" => ^id,
               "bill_extracts_id" => "some updated bill_extracts_id",
               "bill_url" => "some updated bill_url",
               "issued_by" => "some updated issued_by"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, bill: bill} do
      conn = put(conn, ~p"/api/bills/#{bill}", bill: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete bill" do
    setup [:create_bill]

    test "deletes chosen bill", %{conn: conn, bill: bill} do
      conn = delete(conn, ~p"/api/bills/#{bill}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/bills/#{bill}")
      end
    end
  end

  defp create_bill(_) do
    bill = bill_fixture()
    %{bill: bill}
  end
end
