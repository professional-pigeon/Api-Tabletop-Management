class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :location_type, null: false
      t.string :description
      t.string :notes
      t.references :campaign, foreign_key: true, null: false


      t.timestamps
    end
  end
end
