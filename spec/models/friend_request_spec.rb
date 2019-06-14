require 'rails_helper'

RSpec.describe FriendRequest, type: :model do

  describe 'default friend_request details' do
    let(:valid_friend_request) { build :friend_request}
    let(:friend_request) { create :friend_request}
    let(:user) { create :user }
    let(:friend) { create :user }
    let(:friendship) { create :friendship}

    context "FriendRequest validations :" do
      it 'should be valid friend request' do
        expect(valid_friend_request).to be_valid 
      end 

      it 'should be invalid when self friend request' do
        valid_friend_request.receiver = valid_friend_request.sender
        expect(valid_friend_request.valid?).to be false  
      end

      it 'should be invalid friend request when already friends' do
        valid_friend_request = FriendRequest.new(sender: friendship.user, receiver: friendship.friend )
        expect(valid_friend_request.valid?).to be false
      end

    end  
     
    context "Friendrequest associations" do 
      it 'should increase the basic friends when request accepted' do
        user.friendships.create(friend: friend)
        expect(user.basic_friends.count).to eq(1) 
      end

      it 'should increase inverse friends when request accepted' do
        user.friendships.create(friend: friend)
        expect(friend.inverse_friends.count).to eq(1) 
      end  

      it "should'nt send a friend request if it already exists" do
        sender = friend_request.sender
        receiver = friend_request.receiver
        friend_request1 = FriendRequest.new(sender: receiver, receiver: sender)
        expect(friend_request1.valid?).to be false
      end
    end  
    
  end
end