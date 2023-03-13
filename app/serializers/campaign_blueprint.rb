class CampaignBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :notes

  view :full do
    association :locations, blueprint: LocationBlueprint, view: :with_sub_locations
  end
end