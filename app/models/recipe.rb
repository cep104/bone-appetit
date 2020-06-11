class Recipe < ApplicationRecord
    belongs_to :pet_category 
    belongs_to :user
    has_many :measurements 
    has_many :ingredients, through: :measurements
    has_one_attached :recipe_img
    validates :title, presence: true
    validates :description, presence: true
    validates :instructions, presence: true
    validates_associated :pet_category,  message: "Is Already Created"
    

    scope :animal, -> (params){where("pet_category_id = ?", params)}
    
    
   
    def pet_category_attributes=(attributes)
        self.pet_category = PetCategory.find_or_create_by(attributes) if !attributes['name'].empty?
        self.pet_category
      end
      
   def ingredients_attributes=(attributes)
     attributes.values.each do |v|
       self.ingredients << Ingredient.find_or_create_by(v) if !v['name'].empty?
     end
  end

   def measurements_attributes=(attributes)
    attributes.values.each do |measurement_params|
      if !measurement_params.values.any?(&:empty?) && (!measurement_params["ingredient_attributes"]["name"].blank?)
          self.measurements << Measurement.create(measurement_params)
      end
    end
  end
  
    def self.food(params)
        joins(:ingredients).where("LOWER(name) LIKE :term", term: "%#{params}%")
    end

    def self.search(params)
        joins(:pet_category).where("LOWER(title) LIKE :term OR LOWER(description) LIKE :term OR LOWER(name) LIKE :term", term: "%#{params}%")
    end
end
