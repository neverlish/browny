class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_many :spots, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :sayinygs, dependent: :destroy
  has_many :spot_reads, dependent: :destroy
  has_many :liked_spots, through: :likes, source: :spot
  has_many :read_spots, through: :spot_reads, source: :spot
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  def is_spotlike?(spot)
    Like.find_by(user_id: self.id,spot_id: spot.id).present?
  end
  def is_postlike?(post)
    Like.find_by(user_id: self.id,post_id: post.id).present?
  end
end
