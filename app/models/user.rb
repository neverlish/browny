class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :opinions
  has_many :post_reads

  has_many :read_posts, through: :post_reads, source: :post
  has_many :said_spots, through: :sayings, source: :spot
end
