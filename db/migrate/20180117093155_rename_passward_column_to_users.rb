class RenamePasswardColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :passward, :password
  end
end
