class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :delete]
  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(strong_task_params)
    redirect_to task_index_path
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # task = Task.find(params[:id])
    # @task.update(task_params)
    @task.update(strong_task_params)
    redirect_to task_index_path
  end

  def delete
    # task = Task.find(params[:id])
    task.destroy
    redirect_to task_index_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def strong_task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
