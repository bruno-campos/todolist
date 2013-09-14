class Api::TasksController < Api::ApiController

  before_filter :authenticate_user!

  def index
    @tasks = current_user.tasks
    respond_with :api, @tasks
  end

  def show
    @task = current_user.tasks.find(params[:id])
    respond_with :api, @task
  end

  def create
    @task = current_user.tasks.create(task_params)
    respond_with :api, @task
  end

  def update
    @task = current_user.tasks.find(params[:id])
    @task.update(task_params)
    respond_with :api, @task
  end

  def destroy
    @task = current_user.tasks.find(params[:id])
    @task.destroy
    respond_with :api, @task.destroy
  end

  private

  def task_params
    params.require(:task).permit(:name, :priority, :completed)
  end

end