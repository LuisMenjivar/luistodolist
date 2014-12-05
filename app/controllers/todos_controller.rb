class TodosController < ApplicationController 

  def index
    @todo = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save
    redirect_to todos_path, notice: 'Item was saved' 
  end

  def show
    @todo = Todo.find params[:id]
  end


private

def todo_params
  params.require(:todo).permit(:description) 
end


end
