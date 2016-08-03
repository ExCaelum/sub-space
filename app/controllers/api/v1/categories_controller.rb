class Api::V1::CategoriesController < ApplicationController

  def create
    category = current_user.categories.new(category_params)
    if category.save
      render json: category
    else
      render json: {error: "invalid Data"}
    end
  end

  private

  def category_params
    params.permit(:name)
  end

end
