require 'rails_helper'

RSpec.describe Friendship, type: :model do
	describe 'default users' do
		let(:user) { create :user }
   		let(:friend) { create :user }
		let(:friendship) { Friendship.new(user: user, friend: friend) }

		context 'Friendship validations :' do
			it 'should validate valid relationship' do
			   expect(friendship.valid?).to be true
		  	end
		  	it 'should return false for invalid self-friendship' do
	  	   	   friendship.friend = user
		   	   expect(friendship.valid?).to be false
	  		end
		end

	  	

	  	
	  	context 'friendship associations' do
	  		before(:each) do
		  		friendship.save
		  	end
	  		it "should increase user's basic_friends by 1 when friendship is created" do
	  			expect(user.basic_friends).to include(friend)
	  		end

	  		it "should increase friend's inverse_friends by 1 when friendship is created" do
	  			expect(friend.inverse_friends).to include(user)
	  		end

	  		it "should decrease users's basic_friends by 1 when friendship is destroyed" do
	  			expect{friendship.destroy}.to change{friendship.user.basic_friends.count}.from(1).to(0)
	  		end

	  		it "should decrease friend's inverse_friends by 1 when friendship is destroyed" do
	  			expect{friendship.destroy}.to change{friendship.friend.inverse_friends.count}.from(1).to(0)
	  		end

	  		it "can't create same friendship" do
	  			Friendship.new(user: friend, friend: user)
	  			expect(friendship.valid?).to be false
	  		end
	  	end	
	  	
	end
end