class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects.all
  end

  def show
    
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
