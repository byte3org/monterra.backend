defmodule Monterra.BillsTest do
  use Monterra.DataCase

  alias Monterra.Bills

  describe "bills" do
    alias Monterra.Bills.Bill

    import Monterra.BillsFixtures

    @invalid_attrs %{bill_url: nil, amount: nil, issued_by: nil}

    test "list_bills/0 returns all bills" do
      bill = bill_fixture()
      assert Bills.list_bills() == [bill]
    end

    test "get_bill!/1 returns the bill with given id" do
      bill = bill_fixture()
      assert Bills.get_bill!(bill.id) == bill
    end

    test "create_bill/1 with valid data creates a bill" do
      valid_attrs = %{bill_url: "some bill_url", amount: 120.5, issued_by: "some issued_by"}

      assert {:ok, %Bill{} = bill} = Bills.create_bill(valid_attrs)
      assert bill.bill_url == "some bill_url"
      assert bill.amount == 120.5
      assert bill.issued_by == "some issued_by"
    end

    test "create_bill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bills.create_bill(@invalid_attrs)
    end

    test "update_bill/2 with valid data updates the bill" do
      bill = bill_fixture()
      update_attrs = %{bill_url: "some updated bill_url", amount: 456.7, issued_by: "some updated issued_by"}

      assert {:ok, %Bill{} = bill} = Bills.update_bill(bill, update_attrs)
      assert bill.bill_url == "some updated bill_url"
      assert bill.amount == 456.7
      assert bill.issued_by == "some updated issued_by"
    end

    test "update_bill/2 with invalid data returns error changeset" do
      bill = bill_fixture()
      assert {:error, %Ecto.Changeset{}} = Bills.update_bill(bill, @invalid_attrs)
      assert bill == Bills.get_bill!(bill.id)
    end

    test "delete_bill/1 deletes the bill" do
      bill = bill_fixture()
      assert {:ok, %Bill{}} = Bills.delete_bill(bill)
      assert_raise Ecto.NoResultsError, fn -> Bills.get_bill!(bill.id) end
    end

    test "change_bill/1 returns a bill changeset" do
      bill = bill_fixture()
      assert %Ecto.Changeset{} = Bills.change_bill(bill)
    end
  end

  describe "bills" do
    alias Monterra.Bills.Bill

    import Monterra.BillsFixtures

    @invalid_attrs %{bill_url: nil, bill_extracts_id: nil, issued_by: nil}

    test "list_bills/0 returns all bills" do
      bill = bill_fixture()
      assert Bills.list_bills() == [bill]
    end

    test "get_bill!/1 returns the bill with given id" do
      bill = bill_fixture()
      assert Bills.get_bill!(bill.id) == bill
    end

    test "create_bill/1 with valid data creates a bill" do
      valid_attrs = %{bill_url: "some bill_url", bill_extracts_id: "some bill_extracts_id", issued_by: "some issued_by"}

      assert {:ok, %Bill{} = bill} = Bills.create_bill(valid_attrs)
      assert bill.bill_url == "some bill_url"
      assert bill.bill_extracts_id == "some bill_extracts_id"
      assert bill.issued_by == "some issued_by"
    end

    test "create_bill/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bills.create_bill(@invalid_attrs)
    end

    test "update_bill/2 with valid data updates the bill" do
      bill = bill_fixture()
      update_attrs = %{bill_url: "some updated bill_url", bill_extracts_id: "some updated bill_extracts_id", issued_by: "some updated issued_by"}

      assert {:ok, %Bill{} = bill} = Bills.update_bill(bill, update_attrs)
      assert bill.bill_url == "some updated bill_url"
      assert bill.bill_extracts_id == "some updated bill_extracts_id"
      assert bill.issued_by == "some updated issued_by"
    end

    test "update_bill/2 with invalid data returns error changeset" do
      bill = bill_fixture()
      assert {:error, %Ecto.Changeset{}} = Bills.update_bill(bill, @invalid_attrs)
      assert bill == Bills.get_bill!(bill.id)
    end

    test "delete_bill/1 deletes the bill" do
      bill = bill_fixture()
      assert {:ok, %Bill{}} = Bills.delete_bill(bill)
      assert_raise Ecto.NoResultsError, fn -> Bills.get_bill!(bill.id) end
    end

    test "change_bill/1 returns a bill changeset" do
      bill = bill_fixture()
      assert %Ecto.Changeset{} = Bills.change_bill(bill)
    end
  end
end
