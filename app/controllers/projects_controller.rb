class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  
  def index

  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      flash[:notice] = 'Your project was created.'
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @project.update(project_params)
      flash[:notice] = 'Your project was updated.'
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Your project was deleted.'
    redirect_to root_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end