class CheckersController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    checker = current_user.checkers.new(post_id: post.id)
    checker.save
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    checker = current_user.checkers.find_by(post_id: post.id)
    checker.destroy
    redirect_to post_path(post)
  end


end
