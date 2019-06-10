class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validate :not_self
  validate :not_friends

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

    def not_friends
	    if user.inverse_friends.include?(friend) || user.basic_friends.include?(friend)
	      errors.add(:user, 'already friends') 
	    end
  	end

end
