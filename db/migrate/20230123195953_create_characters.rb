class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :species
      t.string :description
      t.string :notes
      t.belongs_to :locations, foreign_key: true

      t.timestamps
    end
end
