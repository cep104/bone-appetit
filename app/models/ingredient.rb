class Ingredient < ApplicationRecord
    has_many :measurements 
    has_many :recipes, through: :measurements
end
