 require 'rails_helper'
 include Warden::Test::Helpers
 Warden.test_mode!

 describe TodosController do
 
   include Devise::TestHelpers
   before do 
    @user3 = create(:user)
    login_as @user3
   end    
   
 
   describe '#create' do
        
     it "redirects to index when todo was successfully saved" do
       
       
       
       post :create, todo: { description: "this is a valid description"}
       expect(response).to redirect_to(todos_path(assigns(:todo)))
     end
     it "redirects to new when todo was not successfully saved" do 
        post :create, todo: { description: "notvalid"}
     end
end
   end
 