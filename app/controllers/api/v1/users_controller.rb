class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  def show
    @user = User.find(params[:id])
    respond_with @user, meta: { example: "info" }
  end

  def create
    @user = User.create!(user_params)
    respond_with @user, location: api_v1_user_url(@user)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :password, :email)
  end

end
