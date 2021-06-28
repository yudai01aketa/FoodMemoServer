class Food < ApplicationRecord
  belongs_to :user
  validates :image_data, :name, :calorie, :purchase_date, presence: true
end
