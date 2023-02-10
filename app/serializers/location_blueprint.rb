class LocationBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :notes, :location_type, :description

  view :with_characters do
    association :characters, blueprint: CharacterBlueprint
  end

  view :with_sub_locations do
    association :sub_locations, blueprint: SubLocationBlueprint
  end

  view :extended do
    association :sub_locations, blueprint: SubLocationBlueprint
    association :characters, blueprint: CharacterBlueprint
  end
end