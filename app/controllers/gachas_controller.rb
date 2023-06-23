class GachasController < ApplicationController
  def index
    category_id = params[:category_id]
    if category_id.present?
      @recipes = Recipe.where(category_id: category_id).order("RANDOM()").limit(1)
    else
      @recipes = Recipe.order("RANDOM()").limit(1)
    end
  end
end
