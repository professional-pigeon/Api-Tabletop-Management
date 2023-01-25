class LocationsController < ApplicationController
  def index
    campaign = Campaign.find(params[:campaign_id])
    locations = campaign.locations
    serialized_locations = LocationBlueprint.render(locations)
    render json: serialized_locations
  end

  def show
    ## set up permissions scheme
    location = Location.find(params[:id])
    serialized_location = LocationBlueprint.render(location)
    render json: serialized_location
  end

  def create
    create_params(params)
    location = Location.create(@create_params)
    serialized_location = LocationBlueprint.render(location)
    render json: serialized_location
  end

  def update
    update_params(params)
    location = Location.find(params[:id])
    location.update(@update_params)
    serialized_location = LocationBlueprint.render(location)
    render json: serialized_location
  end

  def destroy
    location = Location.find(params[:id])
    location.destroy
    head :ok
  end

  private

  def create_params(params)
    @create_params ||= params.permit(:name, :notes, :description, :location_type, :campaign_id)
  end

  def update_params(params)
    @update_params ||= params.permit(:name, :notes, :description, :location_type)
  end
end