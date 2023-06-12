class RecipesController < ApplicationController
  def index
    @recipe = Recipe.order(created_at: :desc)
  end

  def list_display
    @recipe = Recipe.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if  @recipe.save
       redirect_to root_path
    else
     render :new
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:recipe_title,:recipe_material,:recipe_text,:category_id,:price,:image).merge(user_id: current_user.id)
  end
end
