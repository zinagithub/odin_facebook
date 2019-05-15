require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
  	@comment = comments(:one)
  end	
  test 'Valid comment' do
	 assert @comment.valid?  
  end

  test 'Invalid comment without body' do
  	@comment.body = nil
	  refute @comment.valid?  
  end

  test 'Invalid comment without user' do
    @comment.user = nil
    refute @comment.valid?  
  end

  test 'Invalid comment without post' do
    @comment.post = nil
    refute @comment.valid?  
  end

end
