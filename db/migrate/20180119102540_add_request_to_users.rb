class AddRequestToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column:users, :phone, :string
    add_column:users, :place, :string
    add_column:users, :genre, :string
    add_column:users, :date, :date
  end
end
