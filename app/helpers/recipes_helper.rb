module RecipesHelper
    def pet_category_select(recipe)
        if recipe.pet_category.nil?
          select_tag "recipe[pet_category_id]", options_from_collection_for_select(PetCategory.all, :id, :name)
        else
          hidden_field_tag "recipe[pet_category_id]", recipe.pet_category_id
        end
      end
end
