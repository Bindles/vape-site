class ChangeProductsVariantsToJsonb < ActiveRecord::Migration[7.1]
  def change
    change_column :products, :variants, :jsonb, default: []
  end
end
