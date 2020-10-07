class User < ActiveRecord::Base
    has_secure_password
    validates :name, :password, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_many :journeys
    has_many :goals, through: :journeys
end