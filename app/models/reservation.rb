class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :meal
  def confirm!(guest)
    self.update_attribute(state: 1)
  end
  def reject!(guest)
    self.update_attribute(state: -1)
  end
end
