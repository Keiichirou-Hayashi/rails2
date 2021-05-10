class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
end
