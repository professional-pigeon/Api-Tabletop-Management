class SubLocationsController < ApplicationController
  before_action :authorize_request

  def index
    location = Location.find(params[:location_id])
    sub_locations = location.sub_locations
    serialized_res = SubLocationBlueprint.render(sub_locations)
    render json: serialized_res
  end

  def show
    ## set up permissions scheme
    sub_location = SubLocation.find(params[:id])
    serialized_res = SubLocationBlueprint.render(sub_location)
    render json: serialized_res
  end

  def create
    create_params(params)
    sub_location = SubLocation.create(@create_params)
    serialized_res = SubLocationBlueprint.render(sub_location)
    render json: serialized_res
  end

  def update
    update_params(params)
    sub_location = SubLocation.find(params[:id])
    sub_location.update(@update_params)
    serialized_res = SubLocationBlueprint.render(sub_location)
    render json: serialized_res
  end

  def destroy
    sub_location = SubLocation.find(params[:id])
    sub_location.destroy
    head :ok
  end

  private

  def create_params(params)
    @create_params ||= params.permit(:name, :notes, :description, :location_id)
  end

  def update_params(params)
    @update_params ||= params.permit(:name, :notes, :description)
  end
end