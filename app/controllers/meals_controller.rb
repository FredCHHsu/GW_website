class MealsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  def index
    @meals = Meal.all
  end
  def show
    @meal = Meal.find(params[:id])
    @comments = @meal.comments
  end
  def new
    @meal = Meal.new
  end
  def edit
    @meal = current_user.meals.find(params[:id])
  end
  def create
    @meal = current_user.meals.new(meal_params)
    if @meal.save
      current_user.join!(@meal)
      redirect_to meals_path, notice: "新增餐點成功"
    else
      render :new
    end
  end
  def update
    @meal = current_user.meals.find(params[:id])
    if @meal.update(meal_params)
      redirect_to meals_path, notice:"修改成功"
    else
      render :edit
    end
  end
  def destroy
    @meal = current_user.meals.find(params[:id])
    @meal.destroy
      redirect_to meals_path, alert:"餐點已取消"
  end
  def join
    @meal = Meal.find(params[:id])
    if !current_user.is_guest_of?(@meal)
      current_user.join!(@meal)
      flash[:notice] = "加入成功"
    else
      flash[:warning] = "已加入！"
    end
    redirect_to meal_path(@meal)
  end
  def quit
    @meal = Meal.find(params[:id])
    if current_user.is_guest_of?(@meal)
      current_user.quit!(@meal)
      flash[:alert] = "已退出"
    else
      flash[:warning] = "未加入無法退出"
    end
    redirect_to meal_path(@meal)
  end
  private
  def meal_params
    params.require(:meal).permit(:title, :takeType, :price, :address, :menu, 
      :minGuests, :maxGuests, :startTime, :endTime, :picture)
  end
end