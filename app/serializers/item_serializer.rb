class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :unit_price, :merchant_id, :created_at, :updated_at, :description
end
