class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.string :character_type, null: false
      t.string :character_race, default: 'unknown'
      t.string :description, default: ''
      t.string :notes, default: ''
      t.references :char_place, polymorphic: true

      t.timestamps
    end
  end
end
