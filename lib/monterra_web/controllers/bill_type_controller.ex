defmodule MonterraWeb.BillTypeController do
  use MonterraWeb, :controller

  alias Monterra.BillTypes
  alias Monterra.BillTypes.BillType

  action_fallback MonterraWeb.FallbackController

  def index(conn, _params) do
    bill_types = BillTypes.list_bill_types()
    render(conn, :index, bill_types: bill_types)
  end

  def create(conn, %{"bill_type" => bill_type_params}) do
    with {:ok, %BillType{} = bill_type} <- BillTypes.create_bill_type(bill_type_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/bill_types/#{bill_type}")
      |> render(:show, bill_type: bill_type)
    end
  end

  def show(conn, %{"id" => id}) do
    bill_type = BillTypes.get_bill_type!(id)
    render(conn, :show, bill_type: bill_type)
  end

  def update(conn, %{"id" => id, "bill_type" => bill_type_params}) do
    bill_type = BillTypes.get_bill_type!(id)

    with {:ok, %BillType{} = bill_type} <- BillTypes.update_bill_type(bill_type, bill_type_params) do
      render(conn, :show, bill_type: bill_type)
    end
  end

  def delete(conn, %{"id" => id}) do
    bill_type = BillTypes.get_bill_type!(id)

    with {:ok, %BillType{}} <- BillTypes.delete_bill_type(bill_type) do
      send_resp(conn, :no_content, "")
    end
  end
end
