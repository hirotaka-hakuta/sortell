class PostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
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

    @user_group=UserGroup.new
    @user_group.group_id=params[:post][:user_group][:group_id]
    @user_group.post_id=@post.id
    @user_group.user_id=@post.user_id

    @user_group.save
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
      params.require(:post).permit(:image, :post_text)
    end
    # def user_group_params
    #   params.require(:user_group).permit(:group_id)
    # end
end
