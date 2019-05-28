class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: "User"
  validate :not_self

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

    def not_friends
	    if receiver.inverse_friends.include?(sender) || receiver.basic_friends.include?(sender)
	      errors.add(:receiver, 'already friends') 
	    end
  	end

end
