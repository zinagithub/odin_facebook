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

  def delete_request_associated
    request = FriendRequest.where("sender_id = ? AND receiver_id = ?", friend.id, user.id).take
    request.destroy if request
  end

end
