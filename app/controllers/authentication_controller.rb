
class AuthenticationController < ApplicationController
  before_action :authorize_request, except: :login
  skip_before_action :verify_authenticity_token, :only => [:login]

  # POST /auth/login
  # def login
  #   @user = User.find_by_user_name(params[:user_name])
  #   if @user&.authenticate(params[:password])
  #     token = JsonWebToken.encode(user_id: @user.id)
  #     time = Time.now + 24.hours.to_i
  #     session[:user_id] = @user.id
  #     render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
  #                    user_name: @user.user_name }, status: :ok
  #   else
  #     render json: { error: 'unauthorized' }, status: :unauthorized
  #   end
  # end

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