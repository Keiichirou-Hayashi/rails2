class Room < ApplicationRecord

  validates :room_name, presence: true
  validates :introduction, presence: true, length:{in: 10..40}
  validates :price, presence: true
  validates :address, presence: true
  validates :room_image, presence: true

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end


  has_many :reservations
  has_many :users
  belongs_to :user
  mount_uploader :room_image, RoomImageUploader
end
