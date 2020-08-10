class AddBuypriceToPrices < ActiveRecord::Migration[6.0]
  def change
    add_column :prices, :buyprice, :decimal, precision: 8, scale: 2
  end
end
