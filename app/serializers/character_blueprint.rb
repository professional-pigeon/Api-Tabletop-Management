class CharacterBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :notes, :description, :character_race, :character_type
end