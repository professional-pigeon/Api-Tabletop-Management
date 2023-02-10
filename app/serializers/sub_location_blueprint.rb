class SubLocationBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :notes, :description

  view :with_characters do
    association :characters, blueprint: CharacterBlueprint
  end
end