require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
end
