class IssuesController < ApplicationController

  def new
    @issue = Issue.new
    @project = Project.find(params[:project_id])
    @member_names = []
    @project.members.each do |member|
      @member_names << member.username
    end
  end

  def edit
    @issue = set_issue
    if @issue.close_issue
      redirect_to @issue, notice: "This issue has been closed"
    else
      @project = Project.find(@issue.project_id)
      @submitted = User.find_by(username: @issue.assigned_person)
      @member_names = []
      @project.members.each do |member|
        @member_names << member.username
      end
    end
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

  def search
    if params[:summary].present?
      @project = Project.find(params[:id])
      @leader = User.find(@project.owner_id)
      @pmembers = ProjectMember.where(project_id: @project)
      @summary_param = params[:summary].to_s.downcase
      @results = @project.issues.where("lower(summary) LIKE ?", "%#{@summary_param}%")
    else
      redirect_to project_path, notice: "Please provide the search texts"
    end
  end

  def close_issue
    @issue = set_issue
    @issue.toggle!(:close_issue)
    @issue.save
    redirect_to issue_path(@issue), notice: "Close Issue Successfully"
  end

  def update
    @issue = set_issue
    if @issue.update(issue_params)
      flash[:notice] = "Edited Successfully"
      redirect_to @issue
    else
      render 'edit'
    end
  end

  def show
    @issue = set_issue
    @project = Project.find(@issue.project_id)
    @submitted_person = User.find(@issue.user_id)
    @assigned_person = User.find_by(username: @issue.assigned_person)
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
