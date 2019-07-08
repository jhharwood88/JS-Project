class ItemList < ActiveRecord::Migration[5.2]
  def change
  	 create_table :item_lists do |t|
      t.integer :quantity
      t.references :item, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
