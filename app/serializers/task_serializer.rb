class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :event_id
  belongs_to :event
end
