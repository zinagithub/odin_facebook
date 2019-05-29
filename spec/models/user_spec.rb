require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'default users' do
    let(:valid_user) { build :user }
    let(:user) { create :user }
    let(:second) { create :user }
    let(:post) { create :post }
    
    context 'Complete signup details' do
      it 'is valid' do
        valid_user.valid?
        expect(valid_user).to be_valid
      end
    end

    context "name or email is absent" do
      it 'is invalidwhen name is absent' do
       valid_user.name = nil
       expect(valid_user.valid?).to be false
      end

      it 'is invalid when email is absent' do
       valid_user.email = nil
       expect(valid_user.valid?).to be false
      end
    end

    context 'destruction user dependants informations' do
      it "deletes posts when user is detroyed" do
        user.posts.create(body: "body")
        expect{user.destroy}.to change{user.posts.count}.from(1).to(0)
      end

      it "deletes comments when user is detroyed" do
        user.comments.create(body: "body", post: post)
        expect{user.destroy}.to change{user.comments.count}.from(1).to(0)
      end

      it "deletes friendship when user is detroyed" do
        user.friendships.create(friend: second)
        expect{user.destroy}.to change{user.friendships.count}.from(1).to(0)
      end 
    end
  end

end