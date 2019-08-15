class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  validates_presence_of :name

  has_many :posts, dependent: :destroy

  has_many :friend_requests_sent, foreign_key: :sender_id,
            class_name: "FriendRequest", dependent: :destroy
  has_many :friend_requests_received, foreign_key: :receiver_id,
			class_name: "FriendRequest", dependent: :destroy

  has_many :pending_friends, through: :friend_requests_received, source: :sender

  has_many :friends_requested, through: :friend_requests_sent, source: :receiver

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post

  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: :friend_id, dependent: :destroy

  has_many :basic_friends, through: :friendships, source: :friend
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def friends
    basic_friends + inverse_friends
  end

   def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      # user.name =    # assuming the user model has a name
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

  # def feed 
  #   friends1_ids = "SELECT user_id FROM friendships
  #                    WHERE  friend_id = :user_id"
  #   friends2_ids = "SELECT friend_id FROM friendships
  #                    WHERE  friend_iduser_id = :user_id"
  #   friends_ids = friends1_ids + friends2_ids
  #   Post.where("user_id IN (#{friends_ids})
  #                    OR user_id = :user_id", user_id: id)
  # end

end
