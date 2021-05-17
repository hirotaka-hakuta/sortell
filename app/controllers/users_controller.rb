class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @user_groups = UserGroup.where(user_id: @user.id)
    @current_user_groups = UserGroup.where(user_id: current_user.id)
    @user_group = UserGroup.new
  # binding.pry
  end

  def index
    @users = User.all
  end

  def edit; end

  def update; end
  
  def search 
    @users=User.all
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
