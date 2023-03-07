class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  skip_before_action :verify_authenticity_token, :only => [:login]

  def index
  end

  def show
  end

  def create
    create_params(params)
    @user = User.new(@create_params)
    @user.password = params[:password]
    @user.save!
  end

  def destroy
  end

  def update
  end

  private
  def create_params(params)
    @create_params ||= params.permit(:email, :user_name)
  end
end
