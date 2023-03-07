class CampaignsController < ApplicationController
  before_action :authorize_request

  def index
    user = User.find(params[:id])
    campaigns = user.campaigns
    serialized_res = CampaignBlueprint.render(campaigns)
    render json: serialized_res
  end

  def show
    ## set up permissions scheme
    campaign = Campaign.find(params[:id])
    serialized_res = CampaignBlueprint.render(campaign)
    render json: serialized_res
  end

  def create
    create_params(params)
    campaign = Campaign.create(@create_params)
    serialized_res = CampaignBlueprint.render(campaign)
    render json: serialized_res
  end

  def update
    update_params(params)
    campaign = Campaign.find(params[:id])
    campaign.update(@update_params)
    serialized_res = CampaignBlueprint.render(campaign)
    render json: serialized_res
  end

  def destroy
    campaign = Campaign.find(params[:id])
    campaign.destroy
    head :ok
  end

  private

  def create_params(params)
    @create_params ||= params.permit(:name, :notes, :user_id)
  end

  def update_params(params)
    @update_params ||= params.permit(:name, :notes)
  end
end