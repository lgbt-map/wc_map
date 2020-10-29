class CreateCoordinates < ActiveRecord::Migration[5.2]
  def change
    create_table :coordinates do |t|
      t.float "latitude"
      t.float "longitude"
      t.string "name"
      t.string "memo", default: "-----"
      t.string "address"
      t.string "image_id"
      t.timestamps
    end
  end
end
