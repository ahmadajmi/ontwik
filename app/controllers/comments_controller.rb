class CommentsController < ApplicationController
  # before_filter :authenticate_user!, only: [:create, :destroy]
  def create
    @talk = Talk.find(params[:comment][:talk_id])
    @comment = Comment.new(comment_params)
    @comment.talk = @talk
    @comment.profile = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @talk }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @talk = @comment.talk
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:success] = 'Comment deleted.'
        redirect_to @talk
      end
      format.js # JavaScript response
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end
