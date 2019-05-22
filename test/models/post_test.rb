require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
    @user = users(:one)
    
  end	
  test 'post has many comments' do
    assert 1 < @post.comments.count 
  end
  test 'Valid post' do
	assert @post.valid?  
  end

  test 'Invalid without body' do
  	@post.body = nil
	refute @post.valid?  
  end

  test 'Invalid without user' do
  	@post.user = nil
	  refute @post.valid?  
  end

  test 'Comments can be added to post' do  
    assert_difference '@post.comments.count', +1 do
      @post.comments.create(user: @user, body: "the body")
    end  
  end

  test 'Comments are destroyed when post is destroyed ' do
     assert_difference 'Comment.count', -@post.comments.count do
     @post.destroy
    end
  end


  # testing posts_likes association
  test 'should post has any or many likes' do
    assert  @post.likes.count >= 0 
  end 

  test 'when post is liked by user' do
    assert_difference  '@post.likes.count', +1  do
      @post.likes.create(user: @user)
    end
  end  

  test 'when post is unliked by user' do  
    @like = @post.likes.first
    assert_difference  '@post.likes.count', -1  do
      @like.destroy
    end
  end 

  test 'should destroy all likes when the post is destroyed' do
    assert_difference  'Like.all.count',-@post.likes.count  do
      @post.destroy
    end
  end   
end
