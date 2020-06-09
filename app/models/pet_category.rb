class PetCategory < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes
    has_many :pets
    validates :name, presence: true, uniqueness: true
    before_validation :capitalize_name

    private
    def capitalize_name
    name.capitalize!
    end
    
  


 
    
    
    
    # validate :not_a_duplicate

    # def not_a_duplicate
    #     pet_category = PetCategory.find_by(name: name)
    #     if !!pet_category && pet_category != self
    #       errors.add(:pet_category, 'Pet Category has already been created')
    #     end
    #   end
end
