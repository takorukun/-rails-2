class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_intro
      t.bigint :fee_p_d
      t.string :room_image
      t.string :address

      t.timestamps
    end
  end
end
