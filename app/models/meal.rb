class Meal < ActiveRecord::Base
  validates :title, presence: true
  validates :takeType, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :menu, presence: true
  validates :minGuests, presence: true
  validates :maxGuests, presence: true
  validates :startTime, presence: true
  validates :endTime, presence: true
  mount_uploader :picture, PictureUploader

  belongs_to :owner, :class_name => "User", :foreign_key => :user_id
  has_many :reservations
  has_many :guests, :through => :reservations, :source => :user
  has_many :comments

  def editable_by?(user)
    user && user == owner
  end
end