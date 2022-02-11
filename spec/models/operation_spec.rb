require 'rails_helper'

RSpec.describe Operation, type: :model do
  describe 'Fields validations' do
    subject do
      @user1 = User.new(name: 'testUser', email: 'test@gmail.com')
      operation1 = Operation.new(name: 'Operation1', amount: 400, user: @user1)
      @group1 = Group.new(name: 'Group1', icon: 'logo.png', user: @user1)
      @group1.operations << operation1
    end
    it 'name should be present' do
      subject[0].name = nil
      expect(subject[0]).to_not be_valid
    end

    it 'amount should be present' do
      subject[0].amount = nil
      expect(subject[0]).to_not be_valid
    end
  end
end
