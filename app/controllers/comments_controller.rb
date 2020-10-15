class CommentsController < ApplicationController

  def create
    @issue = Issue.find(params[:issue_id])
    @comment = @issue.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to issue_path(@issue), notice: 'Comment can not be blank' }
      end
    end
  end

  def edit
    @comment = @issue.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Editing a comment'
      format.js { render :edit }
    end
  end

  def update
    @comment = @issue.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'The comment has been edited'
          format.js { render :index }
        else
          flash.now[:notice] = 'Failed to edit comment'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'Comment deleted'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:issue_id, :content)
  end

end
