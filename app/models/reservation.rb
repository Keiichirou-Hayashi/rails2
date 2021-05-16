class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :room, optional: true

  with_options presence: true do
    validates :start_date
    validates :end_date
    validates :number_of_people
  end

end
