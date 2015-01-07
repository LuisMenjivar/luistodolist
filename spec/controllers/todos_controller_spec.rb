require 'rails_helper'
# include Warden::Test::Helpers
# Warden.test_mode!

describe TodosController do
 
  include Devise::TestHelpers
  before do 
    @user = create(:user)
    @todo = create(:todo)
    sign_in @user
  end   

  describe '#create' do
   
    it "redirects to index when todo was successfully saved" do
      post :create, todo: { description: "this is a valid description"}
      expect(response).to redirect_to(todos_path)
      # expect(response).to redirect_to(todos_path(assigns(:todo)))
    end
   
    it "redirects to new when todo was not successfully saved" do 
      post :create, todo: { description: ""}
      expect(response).to redirect_to(new_todo_path)
      # expect(response).to redirect_to(new_todo_path(assigns(:todo)))
      #expect(response).to redirect_to(todo_new_url(Todo.last))
    end
   
    it "creates a todo associated with current user" do 
      expect( Todo.where(user_id: @user.id) ).to be_nil
      post :create, todo: { user_id: @user.id }
      expect((Todo.where(user_id: @user.id)).first).to eq(1)
      #expect( Todo.where(user_id: @user.id) ).not_to be_nil
    end
  end
end
 