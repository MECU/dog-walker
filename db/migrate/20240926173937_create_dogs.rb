# frozen_string_literal: true

class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :owner_id

      t.timestamps
    end
  end
end
