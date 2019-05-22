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

  test 'Invalid self friend request' do
	refute @self_friend_request.valid?  
  end

  test 'Invalid friend request if friends' do
    @receiver.inverse_friends << @sender
    refute @friend_request.valid?
  end  

  test 'Sender has friend after request accepted' do
	  assert_difference '@sender.basic_friends.count', +1 do
      @friend_request.accept
    end
  end

  test 'Receiver has friend after request accepted' do
    assert_difference '@receiver.inverse_friends.count', +1 do
      @friend_request.accept
    end
  end

  test "can't send a friend request if it already exists" do
    friend_request = FriendRequest.new(sender: @receiver, receiver: @sender)
    refute friend_request.valid?
  end

end
