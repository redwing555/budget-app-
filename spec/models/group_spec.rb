require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Fields validations' do
    subject do
      @user1 = User.new(name: 'testUser', email: 'test@gmail.com')
      group = Group.new(name: 'Group1', icon: 'logo.png', user: @user1)
    end
    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'Icon should be present' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
