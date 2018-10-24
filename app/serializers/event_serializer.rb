class EventSerializer < ActiveModel::Serializer
    attributes :id, :title, :date, :description, :start_time, :end_time
    has_many :tasks
end