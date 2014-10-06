class Comment < ActiveRecord::Base
  belongs_to :meal
  validates :content, presence: true
  validates :rating, presence: true,
                     inclusion: { in:1..5, message:"must between 1 to 5"}
end
