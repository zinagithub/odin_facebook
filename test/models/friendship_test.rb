require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@friendship = friendships(:one)
  	@self_friendship = friendships(:self_friendship)
  end	
  test 'Valid friendship' do
	assert @friendship.valid?  
  end

  test 'Invalid friendship' do
  	refute @self_friendship.valid?
  end
end
