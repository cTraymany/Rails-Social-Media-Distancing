class Journey < ActiveRecord::Base
    belongs_to :user
    belongs_to :goal

    validates_presence_of :title, :content, :goal

    scope :title_search, -> (user_id, query) {
        where("user_id=?", user_id).
        where("title LIKE ?", "%#{query}%")
    }
end