defmodule Monterra.BillTypes do
  @moduledoc """
  The BillTypes context.
  """

  import Ecto.Query, warn: false
  alias Monterra.Repo

  alias Monterra.BillTypes.BillType

  @doc """
  Returns the list of bill_types.

  ## Examples

      iex> list_bill_types()
      [%BillType{}, ...]

  """
  def list_bill_types do
    Repo.all(BillType)
  end

  @doc """
  Gets a single bill_type.

  Raises `Ecto.NoResultsError` if the Bill type does not exist.

  ## Examples

      iex> get_bill_type!(123)
      %BillType{}

      iex> get_bill_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bill_type!(id), do: Repo.get!(BillType, id)

  @doc """
  Creates a bill_type.

  ## Examples

      iex> create_bill_type(%{field: value})
      {:ok, %BillType{}}

      iex> create_bill_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bill_type(attrs \\ %{}) do
    %BillType{}
    |> BillType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bill_type.

  ## Examples

      iex> update_bill_type(bill_type, %{field: new_value})
      {:ok, %BillType{}}

      iex> update_bill_type(bill_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bill_type(%BillType{} = bill_type, attrs) do
    bill_type
    |> BillType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bill_type.

  ## Examples

      iex> delete_bill_type(bill_type)
      {:ok, %BillType{}}

      iex> delete_bill_type(bill_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bill_type(%BillType{} = bill_type) do
    Repo.delete(bill_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bill_type changes.

  ## Examples

      iex> change_bill_type(bill_type)
      %Ecto.Changeset{data: %BillType{}}

  """
  def change_bill_type(%BillType{} = bill_type, attrs \\ %{}) do
    BillType.changeset(bill_type, attrs)
  end
end
