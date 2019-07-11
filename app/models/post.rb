class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :body, presence: true, length: { maximum: 300 }

  default_scope { order(created_at: :desc) }
  
  mount_uploader :image, PostImageUploader
end
