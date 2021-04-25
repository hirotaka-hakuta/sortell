class GroupsController < ApplicationController
  before_action :authenticate_user!
  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    @user_group=@group
    @group.save
    # binding.pry
    redirect_to posts_path
  end

  def add; end

  def show; end

  def index; end

  def edit; end

  def destroy; end

  private

    def group_params
      params.require(:group).permit(:user_id, :group_name)
    end
end
