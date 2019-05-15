require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
    @user = users(:one)
    
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
  

end
