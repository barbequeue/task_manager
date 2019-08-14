class TasksController < ApplicationController
  before_action :require_task, only: %I[edit update destroy checkout]

  def edit
    respond_to do |format|
      format.js
      format.json { render json: @task, status: 200 }
    end
  end

  def create
    @task = Task.new(task_params)
    @task.project_id = params[:project_id]

    respond_to do |format|
      if @task.save
        format.js
        format.json { render json: @task, status: 200 }
      else
        format.json { render json: @task.errors.messages, status: 422 }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.js
        format.json { render json: @task, status: 200 }
      else
        format.json { render json: @task.errors.messages, status: 422 }
      end
    end
  end

  def destroy
    @task.destroy

    respond_to do |format|
      format.js
      format.json { render json: @task, status: 200 }
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
