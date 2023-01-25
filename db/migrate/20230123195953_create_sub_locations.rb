class CreateSubLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_locations do |t|
      t.string :name, null: false
      t.string :description, default: ''
      t.string :notes, default: ''
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
