defmodule Monterra.BudgetChanges do
  @moduledoc """
  The BudgetChanges context.
  """

  import Ecto.Query, warn: false
  alias Monterra.Repo

  alias Monterra.BudgetChanges.BudgetChange

  @doc """
  Returns the list of budget_changes.

  ## Examples

      iex> list_budget_changes()
      [%BudgetChange{}, ...]

  """
  def list_budget_changes do
    Repo.all(BudgetChange)
  end

  @doc """
  Gets a single budget_change.

  Raises `Ecto.NoResultsError` if the Budget change does not exist.

  ## Examples

      iex> get_budget_change!(123)
      %BudgetChange{}

      iex> get_budget_change!(456)
      ** (Ecto.NoResultsError)

  """
  def get_budget_change!(id), do: Repo.get!(BudgetChange, id)

  @doc """
  Creates a budget_change.

  ## Examples

      iex> create_budget_change(%{field: value})
      {:ok, %BudgetChange{}}

      iex> create_budget_change(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_budget_change(attrs \\ %{}) do
    %BudgetChange{}
    |> BudgetChange.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a budget_change.

  ## Examples

      iex> update_budget_change(budget_change, %{field: new_value})
      {:ok, %BudgetChange{}}

      iex> update_budget_change(budget_change, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_budget_change(%BudgetChange{} = budget_change, attrs) do
    budget_change
    |> BudgetChange.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a budget_change.

  ## Examples

      iex> delete_budget_change(budget_change)
      {:ok, %BudgetChange{}}

      iex> delete_budget_change(budget_change)
      {:error, %Ecto.Changeset{}}

  """
  def delete_budget_change(%BudgetChange{} = budget_change) do
    Repo.delete(budget_change)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking budget_change changes.

  ## Examples

      iex> change_budget_change(budget_change)
      %Ecto.Changeset{data: %BudgetChange{}}

  """
  def change_budget_change(%BudgetChange{} = budget_change, attrs \\ %{}) do
    BudgetChange.changeset(budget_change, attrs)
  end
end
