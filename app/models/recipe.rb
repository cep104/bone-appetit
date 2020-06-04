class Recipe < ApplicationRecord
    belongs_to :pet_category 
    belongs_to :user
    has_one_attached :recipe_img
    accepts_nested_attributes_for :pet_category, reject_if: :all_blank
    validates :title, presence: true
    validates :description, presence: true

    scope :animal, -> (params){where("pet_category_id = ?", params)}
    # def self.filter(params)
    #     where("cat_id = ?", params)
    # end
    def pet_cattegory_attributes=(attributes)
        attributes.values.each do  |ca|
          pet_category = PetCategory.find_or_create_by(ca)
          self.ca.build(pet_category: pet_category)
        end
      end

    def self.search(params)
        joins(:pet_category).where("LOWER(title) LIKE :term OR LOWER(description) LIKE :term OR LOWER(name) LIKE :term", term: "%#{params}%")
    end
end
