class TodosController < ApplicationController 
  
  before_action :authenticate_user!
  
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @user = current_user
    @todo = @user.todos.new(todo_params)
    @todo.save
    redirect_to todos_path, notice: 'Item was saved' 
  end

  # def show
  #   @user = current_user
  #   @todo = @user.todos
  # end


private

def todo_params
  params.require(:todo).permit(:description) 
end


end
