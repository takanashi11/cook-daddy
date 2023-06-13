class RecipesController < ApplicationController
  before_action :set_item2, only:[:list_display]
  before_action :set_item, only:[:show,:move_to_index,:edit,:update,:destroy]
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
    @comments = @recipe.comments.includes(:user)
    @comment = Comment.new(recipe_id: @recipe.id)
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
    redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path
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
