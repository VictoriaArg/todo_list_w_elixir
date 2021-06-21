defmodule Todosapp.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "todos" do
    field :amount, :float
    field :done, :boolean, default: false
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :amount, :done])
    |> validate_required([:title, :amount, :done])
  end
end
