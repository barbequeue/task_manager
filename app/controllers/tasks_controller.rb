class TasksController < ApplicationController
  before_action :require_task, only: %I[edit update destroy checkout]

  def edit
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
      format.json { render json: @project }
    end
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]
    respond_to do |format|
      if @task.save
        format.html { redirect_to projects_url }
        format.js
        format.json { render json: @task, status: :created }
      end
    end
  end

  def update
    @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
      format.json { render json: @project }
    end
  end

  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.js
      format.json { render json: @task, status: :deleted }
    end
  end

  def checkout
    @task.update_attributes(checked: !@task.checked)
  end

  private

  def require_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :project_id)
  end
end
