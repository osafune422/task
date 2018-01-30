class RenamePictureColumnToRequests < ActiveRecord::Migration[5.1]
  def change
    rename_column :requests, :picture, :pictures
  end
end
