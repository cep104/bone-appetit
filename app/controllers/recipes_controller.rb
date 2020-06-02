class RecipesController < ApplicationController
    before_action :get_current_user, only: [:show, :new]
    before_action :set_recipe, only: [:show, :edit, :update]
    
    
    def index
        @recipes = Recipe.all
    end

    def show
    end

    def new
        if params[:pet_category_id] && !PetCategory.exists?(params[:pet_category_id])
            redirect_to root_path,
            alert: "Pet Category not found"
          else
          @recipe = Recipe.new(pet_category_id: params[:pet_category_id])
          end
    end 

    def create
        @recipe = current_user.recipes.new(recipe_params)
        if @recipe.save
        redirect_to recipe_path(@recipe)
        else 
        render :new
        end
    end

    def edit
    end

    def update
        @recipe.update(recipe_params)
    end

    private
    def recipe_params
        params.require(:recipe).permit(:title, :description, :pet_category_id, :user_id, pet_category_attributes:[:name])
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def get_current_user
        @user = User.find(session[:user_id])
      end
end
