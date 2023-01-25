class CampaignBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :notes
  association :locations, blueprint: LocationBlueprint
end