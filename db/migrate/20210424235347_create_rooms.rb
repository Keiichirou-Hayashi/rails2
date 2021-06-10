class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :number_of_people

      t.timestamps
    end
  end
end
