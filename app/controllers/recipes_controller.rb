class RecipesController < ApplicationController
  def index
    @recipe = Recipe.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end
end
