# frozen_string_literal: true

class CreateWalkers < ActiveRecord::Migration[7.1]
  def change
    create_table :walkers do |t|
      t.string :name
      t.timestamps
    end
  end
end
