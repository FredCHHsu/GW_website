class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :meal
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
