class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.float :buyprice
      t.integer :equity_id
      t.integer :user_id

      t.timestamps
    end
  end
end
