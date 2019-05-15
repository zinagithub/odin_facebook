require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
  	@post = posts(:one)
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

  end

  test 'Comments are destroyed when post is destroyed ' do
     
  end


end
