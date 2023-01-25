class CampaignsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    campaigns = user.campaigns
    serialized_campaigns = CampaignBlueprint.render(campaigns)
    render json: serialized_campaigns
  end

  def show
  end

  def create
  end

  def destroy
  end

  def update
  end
end