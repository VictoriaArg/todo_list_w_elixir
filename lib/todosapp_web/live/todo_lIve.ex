defmodule TodosappWeb.TodoLive do
  use TodosappWeb, :live_view
  alias Todosapp.Todos

  def mount(_params, _session, socket) do
    {:ok, fetch(socket)}
  end

  def handle_event("add", %{"todo" => todo}, socket) do
    Todos.create_todo(todo)
    {:noreply, fetch(socket)}
  end

  def handle_event("del", %{"id" => id}, socket) do
    todo = Todos.get_todo!(id)
    Todos.delete_todo(todo)
    {:noreply, fetch(socket)}
  end

  def handle_event("toggle_done", %{"id" => id}, socket) do
    todo = Todos.get_todo!(id)
    Todos.update_todo(todo, %{done: !todo.done})
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, todos: Todos.list_todos())
  end

end
