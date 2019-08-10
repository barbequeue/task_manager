module TasksHelper
  def task_action_url(project, task)
    return project_task_url(project, task) if params[:action] == 'edit'

    project_tasks_url(project)
  end
end
