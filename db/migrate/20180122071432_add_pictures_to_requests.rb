class AddPicturesToRequests < ActiveRecord::Migration[5.1]
  def change
    add_column:requests, :picture, :string
  end
end
