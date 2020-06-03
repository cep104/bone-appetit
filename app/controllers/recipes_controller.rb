class RecipesController < ApplicationController
    before_action :get_current_user, only: [:new]
    before_action :set_recipe, only: [:show, :edit, :update, :destroy]
    
    
    def index
        if params[:user_id]
            @recipes = User.find(params[:user_id]).recipes
          else
        @recipes = Recipe.all
          end
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
        @recipe.recipe_img.attach(params[:recipe_img])
    end

    def update
        @recipe.update(recipe_params)
        redirect_to recipe_path(@recipe)
    end

    def destroy
        @recipe.destroy
    end

    private
    def recipe_params
        params.require(:recipe).permit(:title, :description, :pet_category_id, :user_id, :recipe_img, pet_category_attributes:[:name])
    end

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end

    def get_current_user
        @user = User.find(session[:user_id])
      end
end
