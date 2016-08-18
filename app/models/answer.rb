class Answer < ApplicationRecord
	validates :body, presence: true
	
  belongs_to :user
  belongs_to :spot
  belongs_to :ask
end
