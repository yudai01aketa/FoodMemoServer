class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :image_data
      t.string :name, null: false
      t.integer :calorie, null: false
      t.datetime :purchase_date, null: false
      t.timestamps
    end
  end
end
