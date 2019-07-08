class ItemList < ApplicationRecord

	belongs_to :list
	belongs_to :item

	validates :item_id, presence: true
	validates :item_id, uniqueness: true
	validates :quantity, presence: true
end