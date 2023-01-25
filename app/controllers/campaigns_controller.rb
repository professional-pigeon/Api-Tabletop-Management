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
  end

  def destroy
  end

  def update
  end

  private

  def campaign_params(params)
    @campaign_params ||= params.permit(:name, :notes, :user_id)
  end
end