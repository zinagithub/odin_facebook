require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'default user details' do
    let(:user) { create :user }
    let(:second) { create :user }
    let(:third) { create :user }
    let(:post) { Post.create(body: "body", user: user) }

    it 'should initialize user with name and email' do
      expect(user.name).to eq("Joe")
      expect(user.email).to eq("user1@email.com")
    end

    it 'should return true when user is valid' do
	  expect(user.valid?).to be true
  	end

    it 'should return false when name is absent' do
	 user.name = nil
	 expect(user.valid?).to be false
	end

	it 'should return false when email is absent' do
	 user.email = nil
	 expect(user.valid?).to be false
	end

	it "should be able to create posts" do
      expect{user.posts.create(body: "body")}.to change{user.posts.count}.from(0).to(1)
    end

    it "should be able to create comments" do
      expect{user.comments.create(body: "body", post: Post.create(body: "body", user: user))}.to change{user.comments.count}.from(0).to(1)
    end

    it "can have many posts" do
      user.posts.create(body: "body 1")
      user.posts.create(body: "body 2")
      expect(user.posts.count).to eql(2)
    end

    it "can have many comments" do
      user.comments.create(body: "body 1", post: post)
      user.comments.create(body: "body 2", post: post)
      expect(user.comments.count).to eql(2)
    end

    it "can have many friendships" do
      user.friendships.create(friend: second)
      user.friendships.create(friend: third)
      expect(user.friendships.count).to eql(2)
    end

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