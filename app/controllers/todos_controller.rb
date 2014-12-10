class TodosController < ApplicationController 
  
  before_action :authenticate_user!
  
  def index
    @todos = current_user.todos
  end

  def sec(todo)
    @seconds = 7.days - (Time.now - todo.created_at).to_i
    @days = seconds/86400  
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


  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to todos_path
  end



private

def todo_params
  params.require(:todo).permit(:description) 
end


end
