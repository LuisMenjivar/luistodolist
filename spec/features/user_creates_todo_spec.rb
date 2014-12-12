require 'rails_helper'
  feature 'user creates todo' do 

    scenario 'succesfully' do
      # Create Users
      user = User.new(
        email:    'example@example.com',
        password: 'password'
      )
      
      user.save!

      visit new_user_session_path
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'password'
      puts page.body
      click_button 'Log in'
      visit new_todo_path


      fill_in 'Description', with: 'pay cable bill'
      click_button 'save'
      expect(page).to have_content('Item was saved')
      expect(page).to have_content('pay cable bill')
    end
  end
