class Event < ApplicationRecord
    belongs_to :user
    has_many :tasks
    validates :title, presence: true
    validates :date, presence: true


    def today
        Date.todays
    end

    def seven_days_later
        Date.today + 7 
    end

    def self.collect_weekly_events
        where("date_object >= ? AND date_object <=?", Date.today, Date.today + 7 ).order(date_object: :asc)
       #binding.pry
    end

    def self.found_event(date, current_user)
        where("date = ? AND user_id = ?", date, current_user.id)
    end

    
end
