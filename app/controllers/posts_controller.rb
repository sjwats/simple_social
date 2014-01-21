class PostsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)
    @post.poster_id = current_user.id
    if @post.save
      redirect_to user_path(@user), notice: "Message successfully posted"
    else
      redirect_to user_path(@user)
    end
  end

  def remove
    @post = Post.find(params[:id])
    @user = User.find(@post.poster_id)#user id is the user whose wall was posted on
    @post.delete
    redirect_to user_path(User.find(params[:user_id]))
  end


  protected
  def post_params
    params.require(:post).permit(:message, :user_id, :poster_id)#poster_id?
  end
end
