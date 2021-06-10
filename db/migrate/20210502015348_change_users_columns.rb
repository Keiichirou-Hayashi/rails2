class ChangeUsersColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :area, :string
    add_column :users, :keyword, :string
  end
end
