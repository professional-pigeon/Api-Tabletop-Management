class CampaignsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    campaigns = user.campaigns
    render :json => campaigns
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