class ReservationsController < ApplicationController
  before_action :find_reservation
  def confirm
    @reservation.update_attribute("state", 1)
    redirect_to :back
  end
  def reject
    @reservation.update_attribute("state", -1)
    redirect_to :back
  end
  def recovery
    @reservation.update_attribute("state", 0)
    redirect_to :back
  end
  private
  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
