class PetCategoriesController < ApplicationController
  def show
    @pet_category = PetCategory.find(params[:id])
  end
end
