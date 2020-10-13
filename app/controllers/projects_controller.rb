class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @projects = current_user.projects.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    @project.owner_id = current_user.id
    if @project.save
      @project.invite_member(current_user)
      flash[:notice] = "Project Created"
      redirect_to @project
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Edited Successfully"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Deleted Successfully"
      redirect_to projects_path
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def require_same_user
    project = set_project
    if current_user.id != project.owner_id
      flash[:alert] = "You can only edit or delete your own projects"
      redirect_to @project
    end
  end

end
