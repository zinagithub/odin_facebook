require 'test_helper'

class FriendRequestTest < ActiveSupport::TestCase
  def setup
  	@friend_request = friend_requests(:one)
  	@self_friend_request = friend_requests(:two)
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

 #  test 'Can accept requests' do
	#   
 #  end

 #  test 'Invalid decline friend request' do
	# 
 #  end

end
