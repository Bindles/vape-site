class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :handle
      t.integer :price
      t.string :brand
      t.string :category
      t.text :desc
      t.string :image
      t.string :options
      t.text :variants

      t.timestamps
    end
  end
end
