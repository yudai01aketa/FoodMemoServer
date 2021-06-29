class RenameImageDataColumnToFoods < ActiveRecord::Migration[6.0]
  def change
    rename_column :foods, :image_data, :image_url
  end
end
