class PostsController < ApplicationController
  def create
    @user = User.find(params[:id])
    @post = @user.posts.build(post_params)
    @post.poster_id = current_user.id
    if @post.save
      redirect_to user_event_path(@user, @event), notice: "Message successfully posted"
    else
      redirect_to user_event_path(@user, @event)
    end
  end


  protected
  def comment_params
    params.require(:post).permit(:message, :user_id, :poster_id)#poster_id?
  end
end
