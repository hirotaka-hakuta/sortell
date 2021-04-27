class UserGroupsController < ApplicationController
  before_action :authenticate_user!
  def show; end

  def index; end

  def add;

    @user_group=UserGroup.new()

    @user_group.user_id=params[:user_group][:user_id]
    @user_group.group_id=params[:user_group][:group_id]
    @user_group.save

    redirect_to users_path
  end

end
