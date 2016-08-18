class Post < ApplicationRecord
  belongs_to :user
  belongs_to :spot, dependent: :destroy
  has_many :post_reads
  has_many :read_user, through: :post_reads, source: :user
  has_many :spot_rates
end
