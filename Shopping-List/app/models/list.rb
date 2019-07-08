class List < ApplicationRecord
  belongs_to :user
  has_many :item_lists
  has_many :items, through: :item_lists

  validates :name, presence: true
end
