require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
  	@like = likes(:one)
  end	

  test 'Valid like' do
	  assert @like.valid?  
  end

  test 'Invalid like without user' do
  	  @like.user = nil
	  refute @like.valid?  
  end

  test 'Invalid like without post' do
  	  @like.post = nil
	  refute @like.valid?  
  end
end
