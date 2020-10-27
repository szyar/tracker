class IssuesController < ApplicationController

  def close_list
    @project = Project.find(params[:id])
    @issues = @project.issues.where(close_issue: true)
    @closed_issues = @issues.all.order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end

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
    @project = Project.find(params[:project_id])
    @member_names = []
    @project.members.each do |member|
      @member_names << member.username
    end
    @issue = @project.issues.build(issue_params)
    @issue.user_id = current_user.id
    if @issue.save
      flash[:notice] = "Issue Created"
      redirect_to @issue
    else
      render 'new'
    end

  end

  def search
    @project = Project.find(params[:id])
    if params[:summary].present? || params[:type].present?
      @results = Issue.search(@project, params[:summary], params[:type])
    else
      redirect_to project_path, notice: "Please provide the search keyword or select the issue type"
    end
  end

  def done
    @issue = set_issue
    @issue.status = 'Done'
    @issue.save
    redirect_to issue_path(@issue), notice: "Set Issue Status Done"
  end

  def close_issue
    @issue = set_issue
    @project = Project.find(@issue.project_id)
    if current_user.id == @issue.user_id || current_user.id == @project.owner_id
      if @issue.status == 'Done'
        @issue.toggle!(:close_issue)
        @issue.save
        redirect_to issue_path(@issue), notice: "Close Issue Successfully"
      else
        redirect_to issue_path(@issue), notice: "Status must be done to close issue"
      end
    else
      redirect_to issue_path(@issue), notice: "Only leader or submitted person can close the issue"
    end
  end

  def update
    @issue = set_issue
    if @issue.update(issue_params)
      flash[:notice] = "Edited Successfully"
      redirect_to @issue
    else
      redirect_to edit_issue_path, alert: @issue.errors.full_messages
    end
  end

  def show
    @issue = set_issue
    @project = Project.find(@issue.project_id)
    @submitted_person = User.find(@issue.user_id)
    @assigned_person = User.find_by(username: @issue.assigned_person)
    @comments = @issue.comments
    @comment = @issue.comments.build
  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
  end

  def issue_params
    params.require(:issue).permit(:user_id, :project_id, :summary,
       :detail, :issue_type, :priority, :assigned_person, :status,
       :due_date, :image, :image_cache)
  end

end
