class CommentsController < ApplicationController
  def create
    @user = current_user
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    @comment.user_id = @user.id
    @comment.name = "#{@user.first_name} #{@user.last_name}"
    if @comment.save
      redirect_to user_event_path(current_user, @event), notice: "Comment successfully posted"
    else
      redirect_to user_event_path(current_user, @event), notice: "Comment can't be blank"
    end
  end

  def uncomment
    @comment = Comment.find(params[:id])
    @event = @comment.event
    @user = User.find(@event.creator)
    @comment.destroy
    redirect_to user_event_path(@user, @event)
  end

  protected

  def comment_params
    params.require(:comment).permit(:name, :body, :comment_count, :user_id)
  end
end
