class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
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
end
