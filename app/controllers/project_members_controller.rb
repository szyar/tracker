class ProjectMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :email_exist?, only: [:create]
  before_action :user_exist?, only: [:create]

  def create
    project = Project.find(params[:id])
    if current_user.id == project.owner_id
      user = email_reliable?(assign_params) ? User.find_by_email(assign_params) : nil
      role = params[:role]
      if user
        project.invite_member(user, role)
        redirect_to project_path(project), notice: "Add member successfully"
      else
        redirect_to project_path(project), notice: "Could not add member"
      end
    else
      redirect_to project_path(project), notice: "Only leader can invite members"
    end
  end

  private

  def assign_params
    params[:email]
  end

  def email_exist?
    project = Project.find(params[:id])
    if project.members.exists?(email: params[:email])
      redirect_to projects_path(project), notice: "Email already exist"
    end
  end

  def email_reliable?(address)
    address.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def user_exist?
    project = Project.find(params[:id])
    unless User.exists?(email: params[:email])
      redirect_to projects_path(project), notice: "This email does not exist"
    end
  end

end
