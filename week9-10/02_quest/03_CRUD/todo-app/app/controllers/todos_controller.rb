class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def index
    @todos = Todo.all
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo= Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  def destroy
    @todo= Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end
  
  private
  def todo_params
    params.require(:todo).permit(:title)
  end
end
