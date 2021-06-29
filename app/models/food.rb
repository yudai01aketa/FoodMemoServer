class Food < ApplicationRecord
  belongs_to :user
  before_save :convert_imgur
  attr_accessor :image_data
  validates :image_data, :name, :calorie, :purchase_date, presence: true

  private

    def convert_imgur
      self.image_url = Imgur.upload(image_data)
    end
end
