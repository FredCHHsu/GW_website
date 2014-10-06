class CommentsController < ApplicationController
  def new
    @meal = Meal.find(params[:meal_id])
    @comment = @meal.comments.new
  end
  def edit
    @meal = Meal.find(params[:meal_id])
    @comment = @meal.comments.find(params[:id])
  end
  def create
    @meal = Meal.find(params[:meal_id])
    @comment = @meal.comments.new(comment_params)
    if @comment.save
      redirect_to meal_path(@meal), :notice => "新增評語成功！"
    else
      render :new
    end
  end
  def update
    @meal = Meal.find(params[:meal_id])
    @comment = @meal.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to meal_path(@meal), :notice => "修改評語成功"
    else
      render :edit
    end
  end
  def destroy
    @meal = Meal.find(params[:meal_id])
    @comment = @meal.comments.find(params[:id])
    @comment.destroy
    redirect_to meal_path(@meal), :alert => "評語已刪除"
  end
  private
  def comment_params
    params.require(:comment).permit(:rating, :content)
  end
end
