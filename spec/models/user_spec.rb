require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'default post details' do
    let(:user) { create :user }
    let(:post) { create :post }
    let(:valid_post) { build :post }
    let(:comment) { create :comment}

    context "Post validation" do
      it 'should be valid' do
        expect(valid_post.valid?).to be true
      end

      it 'should be invalid without body' do
        valid_post.body = nil
        expect(valid_post.valid?).to be false  
      end

      it 'should be invalid without user' do
        valid_post.user = nil
        expect(valid_post.valid?).to be false  
      end
    end 

    context "Psost associations" do
      it 'can have many comments' do
        post.comments.create(body: "comment 1", user: user)
        post.comments.create(body: "comment 2", user: user)
        expect(post.comments.count).to eql(2)
      end
      it 'should have any or many likes' do
        post.likes.create(user: user)
        expect(post.likes.count).to be >= 0 
      end 

      it 'should increase likes by one when it is liked by user' do
        expect{post.likes.create(user: user)}.to change{post.likes.count}.from(0).to(1)
      end 

      it 'should decrease likes by one when post is unliked by user' do 
        post.likes.create(user: user)
        expect{post.likes.last.destroy}.to change{post.likes.count}.from(1).to(0)
      end

    end 

    context 'destruction post dependants informations' do
      it 'should destroy all its comments when it is destroyed ' do
        post.comments.create(body: "comment 1", user: user)
        expect{post.destroy}.to change{post.comments.count}.from(1).to(0)   
      end
      it 'should destroy all likes when it is destroyed' do
        post.likes.create(user: user)
        count1 = Like.all.count
        count2 = post.likes.count
        expect{post.destroy}.to change{Like.all.count}.from(count1).to(count1 - count2)
      end  
    end  
  end

end