class LocationsController < ApplicationController
  before_action :authorize_request

  def index
    campaign = Campaign.find(params[:campaign_id])
    locations = campaign.locations
    serialized_res = LocationBlueprint.render(locations)
    render json: serialized_res
  end

  def show
    ## set up permissions scheme
    location = Location.find(params[:id])
    serialized_res = LocationBlueprint.render(location)
    render json: serialized_res
  end

  def create
    byebug
    create_params(params)
    location = Location.new(@create_params)
    if location.save
      serialized_res = LocationBlueprint.render(location)
      render json: serialized_res
    else
      render json: { error: 'unauthorized but here is the mistake' }, status: :unauthorized
    end
  end

  def update
    update_params(params)
    location = Location.find(params[:id])
    location.update(@update_params)
    serialized_res = LocationBlueprint.render(location)
    render json: serialized_res
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