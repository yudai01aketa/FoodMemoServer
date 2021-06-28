class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :image_url
      t.string :name
      t.integer :calorie
      t.datetime :purchase_date

      t.timestamps
    end
  end
end
