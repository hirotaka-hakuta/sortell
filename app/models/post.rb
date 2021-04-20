class Post < ApplicationRecord

  attachment :image
  belongs_to :user 
  has_many :post_comments, dependent: :destroy
  has_many :checkers, dependent: :destroy
  validates :post_text, presence: true
  def checkerd_by?(user)
    checkers.where(user_id: user.id).exists?
  end
end
