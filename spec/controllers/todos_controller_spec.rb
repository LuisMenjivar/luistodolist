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
    end
   
    it "renders new when todo was not successfully saved" do 
      post :create, todo: { description: ""}
      expect(response).to render_template(:new)
    end
   
    it "creates a todo associated with current user" do 
      post :create, todo: { description: "Buy Milk" }
      @user.reload
      todos = @user.todos
      expect(todos.size).to eq 1
      expect(todos.first.description).to eq "Buy Milk"
    end
  end
  describe "#destroy" do 
    
    it "deletes todo" do 
    end
    
    it "does not delete another user's todo" do 
      victim_todo = create(:todo)
      expect { delete :destroy, id: victim_todo.id }.to raise_error(ActiveRecord::RecordNotFound)
      expect(victim_todo.reload.persisted?).to eq(true)
    end

    
  end 
end
 