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

    def self.search(params)
        where("LOWER(title) LIKE ?", "%#{params}%")
    end
end
