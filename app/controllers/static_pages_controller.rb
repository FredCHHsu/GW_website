class StaticPagesController < ApplicationController
  def index
    get_meals
  end
  def how_we_works
  end
  
  private
  def get_meals
    @meals = Meal.all
  end
end
