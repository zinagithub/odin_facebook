require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = users(:one)
  end	
  
  test 'Valid user' do
	assert @user.valid?  
  end

  test 'Invalid without name' do
  	@user.name = nil
  	refute @user.valid?
  	assert_not_nil @user.errors[:name], 'no validation error for name present'
  end

  test 'Invalid user without email'	 do
  	@user.email = nil
  	refute @user.valid?
  	assert_not_nil @user.errors[:email], 'no validation error for name present'
  end
end
