class CommentsController < ApplicationController
  before_action :find_meal
  before_action :authenticate_user!
  after_action :reCalculateUserAvgRating, only:[:create, :update, :destroy]
  def new
    @comment = @meal.comments.new
  end
  def edit
    @comment = current_user.comments.find(params[:id])
  end
  def create
    @comment = @meal.comments.new(comment_params)
    @comment.author = current_user
    if @comment.save
      redirect_to meal_path(@meal), :notice => "新增評語成功！"
    else
      render :new
    end
  end
  def update
    @comment = current_user.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to meal_path(@meal), :notice => "修改評語成功"
    else
      render :edit
    end
  end
  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy
    redirect_to meal_path(@meal), :alert => "評語已刪除"
  end

  private
  def find_meal
    @meal = Meal.find(params[:meal_id])
  end
  def comment_params
    params.require(:comment).permit(:rating, :content)
  end
  def reCalculateUserAvgRating
    @meal.owner.calUserAvgRating
  end
end
