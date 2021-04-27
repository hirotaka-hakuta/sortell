class GroupsController < ApplicationController
  before_action :authenticate_user!
  def create
    # グループ名登録
    @group = Group.new(group_params)
    @user_group=UserGroup.new
    @group.user_id = current_user.id
    @user_group.user_id=@group.user_id
    @group.save
    @user_group.group_id=@group.id.to_i
    @user_group.save
    # binding.pry
    redirect_to posts_path
  end


  def show; end

  def index; end

  def edit; end

  def destroy; end

  private

    def group_params
      params.require(:group).permit(:user_id, :group_name)
    end
end
