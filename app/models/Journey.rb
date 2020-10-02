class Journey < ActiveRecord::Base
    belongs_to :user
    belongs_to :goal

    validates_presence_of :title, :content, :goal

    def self.search(journey_title)
		if !journey_title.blank?
			Journey.where("title LIKE ?", "%#{journey_title}%")
		else
			self.all
		end
    end
end