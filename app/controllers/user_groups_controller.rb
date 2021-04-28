class UserGroupsController < ApplicationController
  before_action :authenticate_user!
  def show; end

  def index; end

  def add
    @user_group = UserGroup.new
    @user_group.user_id = params[:user_group][:user_id]
    @user_group.group_id = params[:user_group][:group_id]
    # 既に所属しているグループの場合、追加できないよう設定する
    @user_groups = UserGroup.where(group_id: @user_group.group_id)

    if @user_groups.find_by(user_id: @user_group.user_id).nil?
      @user_group.save
      flash[:notice] = '登録しました'
    else
      flash[:notice] = '既に選択されたグループに所属しています'
    end
    redirect_to user_path(@user_group.user_id)
  end
end
