class AddIntroductionToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :introduction, :string
  end
end
