class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  def show

  end

  private

  def set_issue
    @issue = Issue.find(params[:id])
    @project = Project.find(@issue.project_id)
    @submitted_person = User.find(@issue.user_id)
    @assigned_person = User.find(@issue.assigned_person)
  end

end
