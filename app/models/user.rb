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
end
