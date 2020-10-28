class CommentsController < ApplicationController
  before_action :set_issue, only: [:create, :edit, :update]

  def create
    @comment = @issue.comments.build(comment_params)
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        flash.now[:alert] = 'Commented'
        format.js { render :index }
      else
        flash.now[:alert] = 'Comment cannot be blank'
        format.js { render :index }
      end
    end
  end

  def edit
    @comment = @issue.comments.find(params[:id])
    if current_user == @comment.user
      respond_to do |format|
        flash.now[:alert] = 'Editing a comment'
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
          flash.now[:alert] = 'The comment has been edited'
          format.js { render :index }
        else
          flash.now[:alert] = 'Failed to edit comment'
          format.js { render :edit_error }
        end
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @issue = @comment.issue
    @project = @issue.project
    if current_user == @comment.user || current_user.id = @project.owner_id
      @comment.destroy
      respond_to do |format|
        flash.now[:alert] = 'Comment deleted'
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
