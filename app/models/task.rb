class Task < ApplicationRecord
    belongs_to :event
    belongs_to :user
    validates :description, presence: true
    validates :status, presence: true
end
