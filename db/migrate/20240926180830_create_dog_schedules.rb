class CreateDogSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_schedules do |t|
      t.integer :dog_id
      t.boolean :monday_morning
      t.boolean :monday_afternoon
      t.boolean :tuesday_morning
      t.boolean :tuesday_afternoon
      t.boolean :wednesday_morning
      t.boolean :wednesday_afternoon
      t.boolean :thursday_morning
      t.boolean :thursday_afternoon
      t.boolean :friday_morning
      t.boolean :friday_afternoon
      t.timestamps
    end
  end
end
