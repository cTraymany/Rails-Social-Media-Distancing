class Entry < ActiveRecord::Base
    belongs_to :user
    belongs_to :goal

    validates_presence_of :title, :content

    def self.search(entry_nme)
        if !entry_name.strip.blank?
          Entry.where("name LIKE ?", "%#{entry_name}%")
        else
          self.all
        end
      end
end