class Entry < ActiveRecord::Base
    belongs_to :user
    belongs_to :goal

    validates_presence_of :title, :content

    def self.search(entry_title)
		if !entry_title.blank?
			Entry.where("title LIKE ?", "%#{entry_title}%")
		else
			self.all
		end
    end
end