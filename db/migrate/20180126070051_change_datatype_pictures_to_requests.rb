class ChangeDatatypePicturesToRequests < ActiveRecord::Migration[5.1]
  def change
    change_column :requests, :pictures, :text
  end
end
