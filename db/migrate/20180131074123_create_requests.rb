class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :name
      t.string :phone
      t.string :place
      t.date :date
      t.string :genre
      t.string :user_id
      t.string :cameraman_id
      t.string :pic1
      t.string :pic2
      t.string :pic3
      t.string :pic4
      t.string :pic5
      t.string :pic6
      t.string :pic7
      t.string :pic8
      t.string :pic9
      t.string :pic10

      t.timestamps
    end
  end
end
