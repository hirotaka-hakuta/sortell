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
    @posts = Post.all.order(id: "DESC")
    @user_group=UserGroup.new
    @user_groups=UserGroup.all
    @group = Group.new
    @groups = Group.all
    @post_groups=PostGroup.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
    @user_groups=UserGroup.where(user_id: current_user.id)

    # binding.pry

# 投稿時に選択したグループを配列から取り出してそれぞれ保存する

    unless params[:post][:user_group][:group_id]==[""]

      for e in params[:post][:user_group][:group_id] do
        @post_group=PostGroup.new
        @post_group.group_id=e.to_i
        @post_group.post_id=@post.id
        unless @post_group.group_id=="" || @post_group.group_id==nil
          @post_group.save
        end
      end
    else
# 投稿時にグループを選択していない場合、全てのグループに属する
      @user_groups.where(user_id: @post.user_id).each do |user_group|

        @post_group=PostGroup.new
        @post_group.group_id=user_group.group_id
        @post_group.post_id=@post.id

        @post_group.save
      end
    end
    else
      flash[:notice] = '本文を入力してください'
    end
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

  def search
    @user_groups=UserGroup.all
    @q =  Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(id: "DESC")
    if @q_header
      @posts = @q_header.result(distinct: true).order(id: "DESC")
    end
  end

  private

    def post_params
      params.require(:post).permit(:image, :post_text)
    end
    # def user_group_params
    #   params.require(:user_group).permit(:group_id)
    # end
end
