class RenamePicturesColumnToRequests < ActiveRecord::Migration[5.1]
  def change
    rename_column :requests, :pictures, :pic1
  end
end
