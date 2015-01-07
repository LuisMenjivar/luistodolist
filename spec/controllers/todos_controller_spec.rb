require 'rails_helper'

describe TodosController do
 
  before do 
    @user = create(:user)
    sign_in @user
  end   

  describe '#create' do
   
    it "redirects to index when todo was successfully saved" do
      post :create, todo: { description: "this is a valid description"}
      expect(response).to redirect_to(todos_path)
      # expect(response).to redirect_to(todos_path(assigns(:todo)))
    end
   
    it "renders new when todo was not successfully saved" do 
      post :create, todo: { description: ""}
      expect(response).to render_template(:new)
      # expect(response).to redirect_to(new_todo_path(assigns(:todo)))
      #expect(response).to redirect_to(todo_new_url(Todo.last))
    end
   
    it "creates a todo associated with current user" do 
      post :create, todo: { description: "Buy Milk" }

      @user.reload
      todos = @user.todos
      expect(todos.size).to eq 1
      expect(todos.first.description).to eq "Buy Milk"
      p todos

      # expect( Todo.where(user_id: @user.id) ).to be_nil
      # post :create, todo: { user_id: @user.id }
      # expect((Todo.where(user_id: @user.id)).first).to eq(1)
      #expect( Todo.where(user_id: @user.id) ).not_to be_nil
    end
  end
end
 