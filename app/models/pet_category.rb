class PetCategory < ApplicationRecord
    has_many :recipes
    has_many :users, through: :recipes
    accepts_nested_attributes_for :recipes, reject_if: :all_blank
end
