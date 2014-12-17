class TodosController < ApplicationController 
  
  before_action :authenticate_user!
  
  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.create(todo_params)
    redirect_to todos_path, notice: 'Item was saved' 
  end

  # def show
  #   @user = current_user
  #   @todo = @user.todos
  # end


  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path, notice: 'Todo was deleted' 
  end



  private

  def todo_params
    params.require(:todo).permit(:description) 
  end


end
