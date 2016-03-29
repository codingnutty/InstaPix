class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :tag, :start_date, :end_date
end
