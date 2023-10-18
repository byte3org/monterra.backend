defmodule Monterra.BillTypesTest do
  use Monterra.DataCase

  alias Monterra.BillTypes

  describe "bill_types" do
    alias Monterra.BillTypes.BillType

    import Monterra.BillTypesFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_bill_types/0 returns all bill_types" do
      bill_type = bill_type_fixture()
      assert BillTypes.list_bill_types() == [bill_type]
    end

    test "get_bill_type!/1 returns the bill_type with given id" do
      bill_type = bill_type_fixture()
      assert BillTypes.get_bill_type!(bill_type.id) == bill_type
    end

    test "create_bill_type/1 with valid data creates a bill_type" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %BillType{} = bill_type} = BillTypes.create_bill_type(valid_attrs)
      assert bill_type.name == "some name"
      assert bill_type.description == "some description"
    end

    test "create_bill_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BillTypes.create_bill_type(@invalid_attrs)
    end

    test "update_bill_type/2 with valid data updates the bill_type" do
      bill_type = bill_type_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %BillType{} = bill_type} = BillTypes.update_bill_type(bill_type, update_attrs)
      assert bill_type.name == "some updated name"
      assert bill_type.description == "some updated description"
    end

    test "update_bill_type/2 with invalid data returns error changeset" do
      bill_type = bill_type_fixture()
      assert {:error, %Ecto.Changeset{}} = BillTypes.update_bill_type(bill_type, @invalid_attrs)
      assert bill_type == BillTypes.get_bill_type!(bill_type.id)
    end

    test "delete_bill_type/1 deletes the bill_type" do
      bill_type = bill_type_fixture()
      assert {:ok, %BillType{}} = BillTypes.delete_bill_type(bill_type)
      assert_raise Ecto.NoResultsError, fn -> BillTypes.get_bill_type!(bill_type.id) end
    end

    test "change_bill_type/1 returns a bill_type changeset" do
      bill_type = bill_type_fixture()
      assert %Ecto.Changeset{} = BillTypes.change_bill_type(bill_type)
    end
  end
end
