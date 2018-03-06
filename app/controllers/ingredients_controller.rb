class IngredientsController < ApplicationController

  def index
    # Search
    if params[:query].present?
      @ingredients = Ingredient.search_by_category_and_main_category(params[:query])
    else
      @ingredients = Ingredient.all
    end

    # Sorting
    if params[:filter].present?
      if params[:filter] == "Rating"
        @ingredients = @ingredients.sort_by { |ingredient| -ingredient.rating }
      elsif params[:filter] == "Price"
        @ingredients = @ingredients.sort_by { |ingredient| ingredient.price }
      end
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end
end
