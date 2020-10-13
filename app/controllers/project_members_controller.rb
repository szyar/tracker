class ProjectMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :email_exist?, only: [:create]
  before_action :user_exist?, only: [:create]

  def create
    project = find_project(params[:project_id])
    user = email_reliable?(assign_params) ? User.find_or_create_by_email(assign_params) : nil
    if user
      project.invite_member(user)
      redirect_to projects_path(project), notice: "Create project successfully"
    else
      redirect_to projects_path(project), notice: "Could not create project"
    end
  end

  private

  def assign_params
    params[:email]
  end

  def email_exist?
    project = find_project(params[:project_id])
    if project.members.exists?(email: params[:email])
      redirect_to projects_path(project), notice: "Email already exist"
    end
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def user_exist?
    project = find_project(params[:project_id])
    unless User.exists?(email: params[:email])
      redirect_to projects_path(project), notice: "This email does not exist"
    end
  end

  def find_project(project_id)
    project = Project.find(params[:project_id])
  end

end
