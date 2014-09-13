class Meal < ActiveRecord::Base
  validates :title, presence: true
  validates :takeType, presence: true
  validates :address, presence: true
  validates :menu, presence: true
  validates :minGuests, presence: true
  validates :maxGuests, presence: true
  validates :startTime, presence: true
  validates :endTime, presence: true
end