class Ask < ApplicationRecord
	validates :body, presence: true
  belongs_to :user
  belongs_to :spot
  has_many :answers
end
