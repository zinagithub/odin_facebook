class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  # validate :not_friends
  validate :not_pending
  validate :not_self
  validate :not_friends

  def accept
    sender.friends << receiver
    receiver.friends << sender
    destroy
  end

  private

  def not_self
    errors.add(:receiver, "can't be equal to user") if sender == receiver
  end

  def not_pending
    errors.add(:receiver, 'already requested friendship') if receiver.friend_requests_received.include?(sender)
  end

  def not_friends
   errors.add(:receiver, 'already requested friendship') if receiver.friends.include?(sender)
  end

end
