class Pet < ApplicationRecord
    belongs_to :user
    belongs_to :pet_category
    has_one_attached :pet_img
    accepts_nested_attributes_for :pet_category, reject_if: :all_blank
    validates :name, presence: true
    validates_associated :pet_category
end
