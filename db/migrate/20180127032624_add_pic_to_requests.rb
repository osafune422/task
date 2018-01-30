class AddPicToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column:requests, :pic2, :string
    add_column:requests, :pic3, :string
    add_column:requests, :pic4, :string
    add_column:requests, :pic5, :string
    add_column:requests, :pic6, :string
    add_column:requests, :pic7, :string
    add_column:requests, :pic8, :string
    add_column:requests, :pic9, :string
    add_column:requests, :pic10, :string
  end
end
