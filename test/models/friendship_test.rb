require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@friendship = friendships(:one)
  	@self_friendship = friendships(:self_friendship)
    @user = users(:three)
    @friend = users(:four)
  end	
  test 'Valid friendship' do
	  assert @friendship.valid?  
  end

  test 'Invalid friendship' do
  	refute @self_friendship.valid?
  end

  test 'User has friend after friendship created' do
    assert_difference '@user.basic_friends.count', +1 do
      @user.friendships.create(friend: @friend)
    end
  end

  test 'Friend has user as friend after friendship created' do
    assert_difference '@friend.inverse_friends.count', +1 do
      @user.friendships.create(friend: @friend)
    end
  end

  test 'User does not have friend after friendship destroyed' do
    assert_difference '@friendship.user.basic_friends.count', -1 do
      @friendship.destroy
    end
  end

  test 'Friend does not have friend after friendship destroyed' do
    friendship = @user.friendships.create(friend: @friend)
    assert_difference '@friend.inverse_friends.count', -1 do
      friendship.destroy
    end
  end
  
end
