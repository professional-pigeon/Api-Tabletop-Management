class LocationBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :notes, :location_type, :description
end