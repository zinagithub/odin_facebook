require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'default user details' do
    let(:user) { create :user }

    it 'should initialize user with name and email' do
      expect(user.name).to eq("Joe")
      expect(user.email).to eq("joe@gmail.com")
    end
  end

end