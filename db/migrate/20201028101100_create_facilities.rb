class CreateFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :facilities do |t|
      t.integer "coordinate_id"
      t.boolean "toilet_jp", default: false
      t.boolean "toilet_west", default: false
      t.boolean "washlet", default: false
      t.boolean "powder_room", default: false
      t.boolean "changing_table", default: false
      t.boolean "wheelchair", default: false
      t.boolean "ostomate", default: false
      t.boolean "gender_separation", default: false
      t.boolean "can_everyone", default: false
      t.timestamps
    end
  end
end
