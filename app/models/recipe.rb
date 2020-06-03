class Recipe < ApplicationRecord
    belongs_to :pet_category 
    belongs_to :user
    has_one_attached :recipe_img
    accepts_nested_attributes_for :pet_category, reject_if: :all_blank
    validates :title, presence: true
    validates :description, presence: true
    def pet_cattegory_attributes=(attributes)
        attributes.values.each do  |ca|
          pet_category = PetCategory.find_or_create_by(ca)
          self.ca.build(pet_category: pet_category)
        end
      end
    # def pet_category_name
    #     self.try(:pet_category).try(:name)
    #   end
    
    #   def pet_category_name=(name)
    #     name = PetCategory.find_or_create_by(name: name)
    #     self.pet_category = pet_category
    #   end
end
