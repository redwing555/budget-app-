require 'rails_helper'

RSpec.feature 'Operations Index Page', type: :feature do
  before(:each) do
    visit new_user_session_path
    @user1 = User.new(name: 'testUser', email: 'test@gmail.com', created_at: Time.now, password: 'test11')
    @group1 = Group.create!(name: 'Group1', icon: 'logo.png', user: @user1)

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'test11'
    click_button 'Log in'
  end

  describe 'GET /index' do
    scenario 'I should see list of Operations' do
      expect(page).to have_content 'Categories'
    end

    scenario 'I should be redirected to add new category page' do
      click_link 'Add a new category'
      expect(current_path).to eq new_group_path
    end

    scenario 'I should see categories list with name and total amount and date button in the body' do
      expect(page).to have_content 'Group1'
      expect(page).to have_content 0
      expect(page).to have_content '11 Feb 2022'
    end
  end
end
