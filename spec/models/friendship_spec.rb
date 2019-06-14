require 'rails_helper'

RSpec.describe Friendship, type: :model do
	describe 'default users' do
		let(:user) { create :user }
   		let(:friend) { create :user }
		let(:friendship) { build(:friendship, user_id: user.id, friend_id: friend.id) }


		context 'Friendship validations :' do
			it 'should validate valid relationship' do
			   expect(friendship).to be_valid
		  	end
		  	it 'should return false for invalid self-friendship' do
	  	   	   friendship.friend = user
		   	   expect(friendship.valid?).to be false
	  		end
		end

	  	it 'should return false for invalid self-friendship' do
	  	   friendship.friend = user
		   expect(friendship.valid?).to be false
	  	end

	  	before(:each) do
	  		friendship.save!
	  	end

	  	it "should increase user's basic_friends by 1 when friendship is created" do
	  		expect(user.friends).to include(friend)
	  	end

	  	it "should increase friend's inverse_friends by 1 when friendship is created" do
	  		expect(friend.friends).to include(user)
	  	end

	  	it "should decrease users's basic_friends by 1 when friendship is destroyed" do
	  		expect{friendship.destroy}.to change{friendship.user.basic_friends.count}.from(1).to(0)
	  	end

	  	it "should decrease friend's inverse_friends by 1 when friendship is destroyed" do
	  		expect{friendship.destroy}.to change{friendship.friend.inverse_friends.count}.from(1).to(0)
	  	end
	end
end