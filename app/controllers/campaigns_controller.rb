class CampaignsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    campaigns = user.campaigns
    serialized_campaigns = CampaignBlueprint.render(campaigns)
    render json: serialized_campaigns
  end

  def show
    ## set up permissions scheme
    campaign = Campaign.find(params[:id])
    serialized_campaign = CampaignBlueprint.render(campaign)
    render json: serialized_campaign
  end

  def create
    create_params(params)
    campaign = Campaign.create(@create_params)
    serialized_campaign = CampaignBlueprint.render(campaign)
    render json: serialized_campaign
  end

  def update
    update_params(params)
    campaign = Campaign.find(params[:id])
    campaign.update(@update_params)
    serialized_campaign = CampaignBlueprint.render(campaign)
    render json: serialized_campaign
  end

  def destroy
  end

  private

  def create_params(params)
    @create_params ||= params.permit(:name, :notes, :user_id)
  end

  def update_params(params)
    @update_params ||= params.permit(:name, :notes)
  end
end