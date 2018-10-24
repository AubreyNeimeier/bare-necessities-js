class TaskSerializer < ActiveModel::Serializer
  attributes :id, :description, :event_id
end
