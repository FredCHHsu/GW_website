class Reservation < ActiveRecord::Base
  belongs_to :meal
  belongs_to :customer, :class_name => "User", :foreign_key => :user_id
  validates :contact_name, presence: true
  validates :contact_mail, presence: true
  validates :contact_phone, presence: true
  def confirm
    self.update_attribute("state", 1)
  end
  def reject
    self.update_attribute("state", -1)
  end
  def recovery
    self.update_attribute("state", 0)
  end
end
