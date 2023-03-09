
class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login

  def login
    @user = User.find_by_user_name(params[:user_name])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: { user_name: @user.user_name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end
end