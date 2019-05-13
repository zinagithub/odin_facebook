require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
  	@friend_request = friend_requests(:one)
  	@self_friend_request = friend_requests(:two)
  	@sender = @friend_request.sender
  	@receiver = @friend_request.receiver
  end	
  
  test 'Valid friend request' do
	assert @friend_request.valid?  
  end

  test 'Invalid without sender' do
  	@friend_request.sender = nil
  	refute @friend_request.valid?
  end

  test 'Invalid self friend request' do
	refute @self_friend_request.valid?  
  end
  # test 'Invalid friend request if friends' do
    
  # end  

  # test 'Can accept requests' do
	 #  @friend_request.accept
	 #  assert_equal 1, @sender.friends.count
  # end

 #  test 'Invalid decline friend request' do
	# 
 #  end

end
