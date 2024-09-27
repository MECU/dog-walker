class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :status
      t.integer :owner_id

      t.timestamps
    end
  end
end
