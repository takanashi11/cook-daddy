class LikesController < ApplicationController
  before_action :set_recipe


  def create
    like = current_user.likes.build(recipe_id: params[:recipe_id])
    like.save
    render 'create.js.erb'
  end

  def destroy
    like = Like.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    like.destroy
    render 'destroy.js.erb'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
