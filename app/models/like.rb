class Like < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  belongs_to :post
end
