class AddBrandIdToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :brand_id, :integer
  end
end
