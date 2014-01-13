class CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.comments.build(comment_params)
    if @comment.save
      redirect_to user_event_path(current_user, @event), notice: "Comment successfully posted"
    else
      render template: "events/show"
    end
  end


  protected
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
