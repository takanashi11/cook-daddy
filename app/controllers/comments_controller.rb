class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @recipe = Recipe.find(params[:recipe_id])
    if @comment.save
      CommentChannel.broadcast_to @recipe, { comment: @comment, user: @comment.user }
    else
      @recipe = Recipe.find(@comment.recipe_id)
      @comments = @recipe.comments.includes(:user)
      render "recipes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
