class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  validate :not_pending
  validate :not_self
  validate :not_friends

  def accept
    sender.basic_friends << receiver
    destroy
  end

  private

  def not_self
    errors.add(:receiver, "can't be equal to user") if sender == receiver
  end

  def not_pending
      errors.add(:receiver, 'already requested friendship') if sender.pending_friends.include?(receiver)
  end

  def not_friends
    if receiver.inverse_friends.include?(sender) || receiver.basic_friends.include?(sender)
      errors.add(:receiver, 'already friends') 
    end
  end

end
