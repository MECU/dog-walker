class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.integer :dog_id
      t.string :status
      t.date :schedule_date
      t.boolean :morning
      t.boolean :afternoon
      t.timestamps
    end
  end
end
