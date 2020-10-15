class CommentsController < ApplicationController
  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to issue_path(@issue), notice: 'Commented' }
      else
        format.html { redirect_to issue_path(@issue), notice: 'Could not post...' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:issue_id, :content)
  end
  
end
