class Item < ApplicationRecord
	has_many :item_lists
  	has_many :lists, through: :item_lists

  	validates :name, :category, :price, presence: true
  	validates :name, uniqueness: true
end
