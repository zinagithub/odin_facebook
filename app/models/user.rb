class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name

  has_many :posts, dependent: :destroy
  has_many :friend_requests_sent, foreign_key: :sender_id,
            class_name: "FriendRequest", dependent: :destroy
  has_many :friend_requests_received, foreign_key: :receiver_id,
			class_name: "FriendRequest", dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id, dependent: :destroy

  has_many :basic_friends, through: :friendships, source: :friend
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def friends
    basic_friends+inverse_friends
  end

end
