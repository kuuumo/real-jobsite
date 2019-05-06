class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.integer :sender
      t.integer :recever

      t.timestamps
    end
  end
end
