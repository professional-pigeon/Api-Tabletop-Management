class LocationBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :notes, :location_type, :description
  association :sub_locations, blueprint: SubLocationBlueprint
end