class IssuesController < ApplicationController

  def new
    @issue = Issue.new
    @project = Project.find(params[:project_id])
  end

  def create
    @issue = Issue.new(issue_params)
    @project = Project.find(params[:project_id])
    @issue.user_id = current_user.id
    @issue.project_id = @project.id
    if @issue.save
      flash[:notice] = "Issue Created"
      redirect_to @issue
    else
      render 'new'
    end
  end

  def show
    @issue = set_issue
    @project = Project.find(@issue.project_id)
    @submitted_person = User.find(@issue.user_id)
    @assigned_person = User.find(@issue.assigned_person)
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:user_id, :project_id, :summary,
       :detail, :issue_type, :priority, :assigned_person, :status,
       :due_date)
  end

end
