class CommentsController < ApplicationController
  # before_filter :authenticate_user!, only: [:create, :destroy]
  def create
    @talk = Talk.find(params[:comment][:talk_id])
    @comment = Comment.new(comment_params)
    @comment.talk = @talk
    @comment.profile = current_user
    @comment.save
    redirect_to @talk
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
