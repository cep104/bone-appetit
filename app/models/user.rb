class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, :presence => { :on => :create },
          :length   => { :minimum => 6, :allow_nil => true },
          :confirmation => true
    validates :password_confirmation, :presence => true
    has_secure_password
end
