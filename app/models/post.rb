class Post < ApplicationRecord
    belongs_to :user
    attachment :image
    has_many :post_comments, dependent: :destroy
    has_many :checkers, dependent: :destroy

    def checkerd_by?(user)
        checkers.where(user_id: user.id).exists?
    end
end
