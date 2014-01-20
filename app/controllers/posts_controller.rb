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


  protected
  def post_params
    params.require(:post).permit(:message, :user_id, :poster_id)#poster_id?
  end
end
