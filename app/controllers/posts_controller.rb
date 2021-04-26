class PostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @post = Post.find(params[:id])
    @post_groups=PostGroup.where(post_id: @post.id)
    # 投稿時のグループが何も選択されていない時、全てのグループに属する
    if @post_groups==[]
      @post_groups=Group.where(user_id: @post.user_id)
    end
    @post_comment = PostComment.new
    # binding.pry
  end

  def index
    @post = Post.new
    @posts = Post.all
    @user_group=UserGroup.new
    @group = Group.new
    @groups = Group.all

  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    @post.save
    @user_groups=UserGroup.where(user_id: current_user.id)
    @post_group=PostGroup.new
    binding.pry

# 投稿時に選択したグループを配列から取り出してそれぞれ保存する
      e=0
    unless params[:post][:user_group][:group_id]==[]

      for e in params[:post][:user_group][:group_id] do
        @post_group.group_id=params[:post][:user_group][:group_id][e.to_i-1]
        @post_group.post_id=@post.id
        @post_group.save
      end
    else
# 投稿時にグループを選択していない場合、全てのグループに属する
      for e in @user_groups do
        @post_group.group_id=@user_groups[e.to_i-1]
        @post_group.post_id=@post.id
        @post_group.save
      end
    end

    # binding.pry
    redirect_to posts_path
  end

  def edit; end

  def new
    @post = Post.new
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:mage, :post_text)
    end
    # def user_group_params
    #   params.require(:user_group).permit(:group_id)
    # end
end
