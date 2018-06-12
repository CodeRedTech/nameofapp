class ChangePriceTypeInProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, 'numeric USING CAST(price AS numeric)'
  end
end
