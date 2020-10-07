class Goal < ActiveRecord::Base
    has_many :journeys
    has_many :users, through: :journeys

    validates :name, :description, presence: true
end