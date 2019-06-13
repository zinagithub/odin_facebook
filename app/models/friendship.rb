class Friendship < ApplicationRecord
  after_save :delete_request_associated

  belongs_to :user
  belongs_to :friend, class_name: "User"
  validate :not_self
  validate :not_friends

  private

  def not_self
    errors.add(:friend, "can't be equal to user") if user == friend
  end

  def not_friends
    errors.add(:friend, "already in friendlist") if user.friends.include?(friend)
  end 
  #zina
  def prevent_duplicate_record
    return true if user.friends.include?(friend) || friend.friends.include?(user)
    false
  end  

  def delete_request_associated
       # logic that finds the request associated 
       #for the friendship record (user_id is sender_id and friend_id is receiver_id) and destroys it
  end

end
