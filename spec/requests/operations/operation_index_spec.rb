require 'rails_helper'

RSpec.feature 'Operations Index Page', type: :feature do
  before(:each) do
    visit new_user_session_path
    @user1 = User.new(name: 'testUser', email: 'test@gmail.com', created_at: Time.now, password: 'test11')
    operation1 = Operation.create!(name: 'Operation1', amount: 30, user: @user1)
    operation2 = Operation.create!(name: 'Operation2', amount: 20, user: @user1)
    operation3 = Operation.create!(name: 'Operation3', amount: 150, user: @user1)
    @group1 = Group.create!(name: 'Group1', icon: 'logo.png', user: @user1)
    @group1.operations << [operation1, operation2, operation3]

    fill_in 'Email', with: 'test@gmail.com'
    fill_in 'Password', with: 'test11'
    click_button 'Log in'
    click_link 'Group1'
  end

  describe 'GET /index' do
    scenario 'I should see list of Operations' do
      expect(page).to have_content 'Transactions'
    end

    scenario 'I should be redirected to add new Operation page' do
      click_link 'Add a new transaction'
      expect(current_path).to eq new_group_operation_path(@group1.id)
    end

    scenario 'I should see operations list with name and amount and date button in the body' do
      expect(page).to have_content 'Operation1'
      expect(page).to have_content 20
      expect(page).to have_content '10 Feb 2022'

      expect(page).to have_content 'Operation2'
      expect(page).to have_content 150
      expect(page).to have_content '10 Feb 2022'
    end
  end
end
