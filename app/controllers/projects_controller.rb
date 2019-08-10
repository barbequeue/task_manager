class ProjectsController < ApplicationController
  before_action :require_project, only: %I[edit update destroy]

  def index
    @projects = Project.all.order(created_at: :desc)
    @project = Project.new
  end

  def edit
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
      format.json { render json: @project }
    end
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_url }
        format.js
        format.json { render json: @project, status: :created }
      else
        format.html { render action: "index" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project.update(project_params)
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
      format.json { render json: @project }
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
      format.json { render json: @project, status: :deleted }
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def require_project
    @project = Project.find(params[:id])
  end
end
