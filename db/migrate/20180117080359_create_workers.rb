class CreateWorkers < ActiveRecord::Migration[5.1]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :status

      t.timestamps
    end
  end
end
