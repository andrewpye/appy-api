class AppSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :status
  belongs_to :created_by
  has_one :image
end
