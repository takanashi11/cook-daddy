class RecipesController < ApplicationController
  before_action :set_item2, only:[:list_display]
  before_action :set_item, only:[:show,:move_to_index]
 # before_action :move_to_index, except: [:index, :show,:new,:create]


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

  def show

  end

  private
  def recipe_params
    params.require(:recipe).permit(:recipe_title,:recipe_material,:recipe_text,:category_id,:price,:image).merge(user_id: current_user.id)
  end

  def set_item
    @recipe = Recipe.find(params[:id])
  end

  def set_item2
    @recipe = Recipe.order(created_at: :desc)
  end

  def move_to_index
    if current_user.id != @recipe.user.id 
      redirect_to root_path
     end
  end
end
