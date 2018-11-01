class EventSerializer < ActiveModel::Serializer
    attributes :id, :title, :date, :description
    has_many :tasks
end
