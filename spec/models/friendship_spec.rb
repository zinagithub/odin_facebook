require 'rails_helper'

RSpec.describe Friendship, type: :model do
	describe 'default users' do
		let(:user) { create :user }
   		let(:friend) { create :user }
		let(:friendship) { Friendship.create(user: user, friend: friend) }


		it 'should return true when friendship is valid' do
		   expect(friendship.valid?).to be true
	  	end

	  	it 'should return false for invalid selffriendship' do
	  	   friendship.friend = user
		   expect(friendship.valid?).to be false
	  	end

	  	it "should increase user's basic_friends by 1 when friendship is created" do
	  		expect{user.friendships.create(friend: friend)}.to change{user.basic_friends.count}.from(0).to(1)
	  	end

	  	it "should increase friend's inverse_friends by 1 when friendship is created" do
	  		expect{user.friendships.create(friend: friend)}.to change{friend.inverse_friends.count}.from(0).to(1)
	  	end

	  	it "should decrease users's basic_friends by 1 when friendship is destroyed" do
	  		expect{friendship.destroy}.to change{friendship.user.basic_friends.count}.from(1).to(0)
	  	end

	  	it "should decrease friend's inverse_friends by 1 when friendship is destroyed" do
	  		expect{friendship.destroy}.to change{friendship.friend.inverse_friends.count}.from(1).to(0)
	  	end
	end
end