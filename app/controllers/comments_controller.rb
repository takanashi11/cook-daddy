class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to recipe_path(@comment.recipe_id) 
    else
      @prototype = @comment.recipe
      @comments = @recipe.comments
      render "recipes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
