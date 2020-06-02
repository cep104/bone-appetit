class User < ApplicationRecord
    has_many :recipes
    has_many :pet_catigories, through: :recipes
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :password, :presence => { :on => :create },
          :length   => { :minimum => 6, :allow_nil => true },
          :confirmation => true
    validates :password_confirmation, :presence => true
    has_secure_password
   

    
end
