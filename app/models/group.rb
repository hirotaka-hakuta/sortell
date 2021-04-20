class Group < ApplicationRecord
    has_many :user_groups, dependent: :destroy
end
