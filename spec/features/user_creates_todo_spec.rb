require 'rails_helper'
  feature 'user creates todo' do 

    scenario 'succesfully'do 
      visit new_todo_path
      fill_in 'Description', with: 'pay cable bill'
      click_button 'save'
      expect(page).to have_content('Item was saved')
      expect(page).to have_content('pay cable bill')
    end
  end
