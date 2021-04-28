class Group < ApplicationRecord
  has_many :user_groups, dependent: :destroy
  has_many :post_groups, dependent: :destroy
  validates :group_name, presence: true
end
