class CommentsController < ApplicationController
  before_action :set_issue, only: [:create, :edit, :update]

  def create
    @comment = @issue.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        flash.now[:notice] = 'Commented'
        format.js { render :index }
      else
        flash.now[:notice] = 'Comment cannot be blank'
        format.js { render :index }
      end
    end
  end

  def edit
    @comment = @issue.comments.find(params[:id])
    if current_user == @comment.user
      respond_to do |format|
        flash.now[:notice] = 'Editing a comment'
        format.js { render :edit }
      end
    else
      redirect_to issue_path(@issue), notice: "You can only edit and delete your comments"
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
    if current_user == @comment.user
      @comment.destroy
      respond_to do |format|
        flash.now[:notice] = 'Comment deleted'
        format.js { render :index }
      end
    else
      redirect_to issue_path(@issue), notice: "You can only edit and delete your comments"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:issue_id, :content)
  end

  def set_issue
    @issue = Issue.find(params[:issue_id])
  end

end
