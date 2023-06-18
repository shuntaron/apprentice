class TodosController < ApplicationController
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: { todo: {id: todo.id, title: todo.title} }
    else
      render json: { error: todo.errors.full_messages }
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title)
  end
  
end
