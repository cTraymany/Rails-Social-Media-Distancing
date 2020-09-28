class Entry < ActiveRecord::Base
    belongs_to :user
    belongs_to :goal

    validates_presence_of :title, :content
end