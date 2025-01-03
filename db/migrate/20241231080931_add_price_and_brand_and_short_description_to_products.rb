class AddPriceAndBrandAndShortDescriptionToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :price, :decimal
    add_column :products, :short_description, :string
    add_column :products, :brand, :string
  end
end
