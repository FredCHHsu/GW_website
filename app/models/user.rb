class User < ActiveRecord::Base
  has_many :meals

  has_many :meal_guests
  has_many :participated_meals, :through => :meal_guests, :source => :meal

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:facebook]
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # FB name
      user.image = auth.info.image # FB image
      user.fblink = auth.info.urls.Facebook   # FB link
    end
  end
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
  def join!(meal)
    participated_meals << meal
  end
  def quit!(meal)
    participated_meals.delete(meal)
  end
  def is_member_of?(meal)
    participated_meals.include?(meal)
  end
end
