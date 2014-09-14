class MealsController < ApplicationController
  def index
    @meals = Meal.all
  end
  def show
    @meal = Meal.find(params[:id])
  end
  def new
    @meal = Meal.new
  end
  def edit
    @meal = Meal.find(params[:id])
  end
  def create
    @meal = Meal.new(meal_params)
    if @meal.save
      redirect_to meals_path, notice: "新增餐點成功"
    else
      render :new
    end
  end
  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      redirect_to meals_path, notice:"修改成功"
    else
      render :edit
    end
  end
  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
      redirect_to meals_path, alert:"餐點已取消"
  end
  private
  def meal_params
    params.require(:meal).permit(:title, :takeType, :price, :address, :menu, 
      :minGuests, :maxGuests, :startTime, :endTime, :picture)
  end
end