class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status
end
