class ProjectsController < ApplicationController
  before_action :require_project, only: %I[edit update destroy]
  before_action :authenticate_user!

  def index
    @projects = current_user.projects.order(created_at: :desc)
    @project = current_user.projects.new
  end

  def edit
    respond_to do |format|
      format.js
      format.json { render json: @project, status: 200 }
    end
  end

  def create
    @project = current_user.projects.new(project_params)

    respond_to do |format|
      if @project.save
        format.js
        format.json { render json: @project, status: 200 }
      else
        format.json { render json: @project.errors.messages, status: 422 }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.js
        format.json { render json: @project, status: 200 }
      else
        format.json { render json: @project.errors.messages, status: 422 }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.js
      format.json { render json: @project, status: 200 }
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def require_project
    @project = current_user.projects.find(params[:id])
  end
end
