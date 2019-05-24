require 'rails_helper'

RSpec.describe FriendRequest, type: :model do

  describe 'default post details' do
    let(:user) { create :user }
    let(:second) { create :user }
    let(:third) { create :user }
    let(:post) { create :post }
    let(:comment) { create :comment}
    let(:friend_request) { create :friend_request}
    let(:friendship) { create :friendship}

    it 'should be valid friend request' do
     expect(friend_request.valid?).to be true  
    end 

    it 'should be invalid when self friend request' do
      friend_request.sender = user
      friend_request.receiver = user
      expect(friend_request.valid?).to be false  
    end

    it 'should be invalid friend request when already friends' do
      user   = friendship.user
      friend = friendship.friend
      friend_request = FriendRequest.new(sender:user, receiver:friend)
      expect(friend_request.valid?).to be false
    end 

    it 'should increase the basic friends when request accepted' do
      user.friendships.create(friend: second)
      expect(user.basic_friends.count).to eq(1) 
    end
    it 'should increase inverse friends when request accepted' do
      user.friendships.create(friend: second)
      expect(second.inverse_friends.count).to eq(1) 
    end  

    it "should'nt send a friend request if it already exists" do
      friend_request1 = FriendRequest.new(sender: friend_request.receiver , receiver: friend_request.sender)
      expect(friend_request1.valid?).to be false
    end
  end
end