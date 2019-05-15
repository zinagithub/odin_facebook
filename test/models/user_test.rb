require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = users(:one)
  end	
  
  test 'user has many friends' do
    assert 1 < @user.friends.count 
  end

  test 'user has many posts' do
    assert 1 < @user.posts.count 
  end 
  test 'user has many comments' do
    assert 1 < @user.comments.count 
  end 
  test 'Valid user' do
	assert @user.valid?  
  end

  test 'Invalid without name' do
  	@user.name = nil
  	refute @user.valid?
  	assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'Invalid user without email'	 do
  	@user.email = nil
  	refute @user.valid?
  	assert_not_nil @user.errors[:email], 'no validation error for name present'
  end

  test 'Can create posts'  do
   assert_difference '@user.posts.count', +1 do
      @user.posts.create(body:'asdasdads')
    end
  end

  test 'Post is destroyed when user is destroyed'  do
    @user.destroy
    assert_empty Post.where(user: @user)
  end

  test 'Can create comments'  do
    assert_difference '@user.comments.count', +1 do
      @user.comments.create(body:'asdasdads', post: posts(:one))
    end
  end

  test 'Comment is destroyed when user is destroyed'  do
    assert_difference 'Comment.count', -@user.comments.count do
     @user.destroy
    end
  end

end
