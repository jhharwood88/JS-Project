class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :price

  has_many :item_lists
end
