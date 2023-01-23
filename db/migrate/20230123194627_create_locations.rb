class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :description
      t.string :notes
      t.belongs_to :campaigns, foreign_key: true


      t.timestamps
    end
  end
end
