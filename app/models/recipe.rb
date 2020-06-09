class Recipe < ApplicationRecord
    belongs_to :pet_category 
    belongs_to :user
    has_many :measurements 
    has_many :ingredients, through: :measurements
    has_one_attached :recipe_img
    validates :title, presence: true
    validates :description, presence: true
    validates_associated :pet_category,  message: "Is Already Created"
    

    scope :animal, -> (params){where("pet_category_id = ?", params)}
    
    def pet_category_attributes=(attributes)
        self.pet_category = PetCategory.find_or_create_by(attributes) if !attributes['name'].empty?
        self.pet_category
      end


    def self.search(params)
        joins(:pet_category).where("LOWER(title) LIKE :term OR LOWER(description) LIKE :term OR LOWER(name) LIKE :term", term: "%#{params}%")
    end
end
