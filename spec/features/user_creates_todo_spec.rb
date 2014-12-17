require 'rails_helper'

include Warden::Test::Helpers
Warden.test_mode!


  feature 'user creates todo' do 
    
    before do 
      @user1 = create(:user)
      login_as @user1
    end

    scenario 'succesfully' do
      # Create Users
      # user = User.new(
      #   email:    'example@example.com',
      #   password: 'password'
      # )
      # user.save!



      visit new_todo_path


      fill_in 'Description', with: 'pay cable bill'
      click_button 'save'
      expect(page).to have_content('Item was saved')
      expect(page).to have_content('pay cable bill')
    end
  end
