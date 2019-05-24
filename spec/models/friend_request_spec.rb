require 'rails_helper'

RSpec.describe FriendRequest, type: :model do

  describe 'default friend_request details' do
    let(:friend_request) { create :friend_request}
    let(:user) { create :user }
    let(:friend) { create :user }
    let(:friendship) { create :friendship}

    it 'should be valid friend request' do
     expect(friend_request.valid?).to be true  
    end 

    it 'should be invalid when self friend request' do
      friend_request.receiver = friend_request.sender
      expect(friend_request.valid?).to be false  
    end

    it 'should be invalid friend request when already friends' do
      friend_request = FriendRequest.new(sender: friendship.user, receiver: friendship.friend )
      expect(friend_request.valid?).to be false
    end 

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