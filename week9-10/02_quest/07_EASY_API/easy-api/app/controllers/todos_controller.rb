class TodosController < ApplicationController
  def create
    todo = Todo.new(todo_params)
    if todo.save
      render json: { todo: todo }, except: [:created_at, :updated_at]
    else
      render json: { error: todo.errors.full_messages }
    end
  end
  
  def index
    todos = Todo.all
    render json: { todos: todos }, except: [:created_at, :updated_at]
  end
  
  def update
    todo = Todo.find(params[:id])
    if todo.update(todo_params)
      render json: { todo: todo }, except: [:created_at, :updated_at]
    else
      render json: { error: todo.errors.full_messages }
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:title)
  end
  
end
