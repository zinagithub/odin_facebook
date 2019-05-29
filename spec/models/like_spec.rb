require 'rails_helper'

RSpec.describe Like, type: :model do
	describe 'default likes' do
		let(:like) { build :like }

		context "like with post and user" do
			it 'should return true when like is valid' do
		   		expect(like).to be_valid
		  	end
		end
		
		context "like without user or post" do
		  	it 'should return false when like is invalid becaouse of empty user' do
		  	   like.user = nil
			   expect(like.valid?).to be false
		  	end

		  	it 'should return false when like is invalid becaouse of empty post' do
		  	   like.post = nil
			   expect(like.valid?).to be false
		  	end
		end	
		
	end
end