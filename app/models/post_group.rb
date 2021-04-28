class PostGroup < ApplicationRecord
  belongs_to :post
  belongs_to :group
end
