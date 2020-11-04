class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer "coordinate_id"
      t.float "cleanliness", default: 0
      t.float "breadth", default: 0
      t.float "luxury", default: 0
      t.float "use_rate", default: 0
      t.float "security", default: 0
      t.timestamps
    end
  end
end
