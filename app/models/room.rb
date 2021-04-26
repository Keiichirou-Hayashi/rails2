class Room < ApplicationRecord
  has_many :reservations
  has_many :users
  mount_uploader :image, ImageUploader
end
