class MealsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :find_meal, only:[:show, :edit, :update, :destroy]
  def index
    @meals = Meal.all
  end
  def show
  end
  def new
    @meal = Meal.new
  end
  def edit
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
    if @meal.update(meal_params)
      redirect_to meals_path, notice:"修改成功"
    else
      render :edit
    end
  end
  def destroy
    @meal.destroy
      redirect_to meals_path, alert:"餐點已取消"
  end
  private
  def find_meal
    @meal = Meal.find(params[:id])
  end
  def meal_params
    params.require(:meal).permit(:title, :takeType, :price, :address, :menu, 
      :minGuests, :maxGuests, :startTime, :endTime, :picture)
  end
end