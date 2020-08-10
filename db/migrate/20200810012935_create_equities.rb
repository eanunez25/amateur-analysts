class CreateEquities < ActiveRecord::Migration[6.0]
  def change
    create_table :equities do |t|
      t.string :ticker
      t.integer :user_id

      t.timestamps
    end
  end
end
