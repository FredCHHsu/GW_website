class Comment < ActiveRecord::Base
  belongs_to :meal
  belongs_to :author, :class_name => "User", :foreign_key => :user_id
  validates :content, presence: true
  validates :rating, presence: true,
                     inclusion: { in:1..5, message:"must between 1 to 5"}
  def editable_by?(user)
    user && user == author
  end
end
