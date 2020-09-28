class User < ActiveRecord::Base
    has_secure_password
    validates :name, :password, presence: true
    validates :email, presence: true, uniqueness: true
    
    has_many :entries
    has_many :goals, through: :entries

    accepts_nested_attributes_for :entries, :goals
end