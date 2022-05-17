class TasksController < ApplicationController
before_action :set_tasks, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(tasks_params)
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def show
  end

  def edit
  end

  def update
    @task.update(tasks_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end


  def set_tasks
    @task = Task.find(params[:id])
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
