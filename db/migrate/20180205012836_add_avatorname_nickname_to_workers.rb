class AddAvatornameNicknameToWorkers < ActiveRecord::Migration[5.1]
  def change
    add_column :workers, :nickname, :string
    add_column :workers, :avator_name, :string
  end
end
