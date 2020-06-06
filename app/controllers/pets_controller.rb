class PetsController < ApplicationController
    before_action :get_current_user, only: [:new]
    before_action :set_pet, only: [:show, :edit, :update, :destroy]

    def show
       
    end

    def new
        if params[:pet_category_id] && !PetCategory.exists?(params[:pet_category_id])
            redirect_to root_path,
            alert: "Pet Category not found"
          else
          @pet = Pet.new(pet_category_id: params[:pet_category_id])
          end
    end 

    def create
        @pet = current_user.pets.new(pet_params)
        if @pet.save
        redirect_to pet_path(@pet)
        else 
        render :new
        end
    end

    def edit
        @pet.pet_img.attach(params[:pet_img])
    end

    def update
        @pet.update(pet_params)
        redirect_to pet_path(@pet)
    end

    def destroy
        @user = current_user
        @pet.destroy
        redirect_to @user
    end

    def pet_params
        params.require(:pet).permit(:name, :pet_category_id, :user_id, :pet_img, pet_category_attributes:[:name])
    end

    def set_pet
        @pet = Pet.find(params[:id])
    end

    def get_current_user
        @user = User.find(session[:user_id])
      end
end
