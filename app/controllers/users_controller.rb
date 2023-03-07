class UsersController < ApplicationController
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

  def login
    @user = User.find_by_user_name(params[:user_name])
    if @user.password == params[:password]
      render status: :ok, json: { message: 'you have logged in'}
    else
      render status: 401, json: { error_code: 401, message: 'incorrect password or email' }
    end
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
