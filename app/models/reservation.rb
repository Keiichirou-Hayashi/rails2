class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :number_of_people
  end

end
