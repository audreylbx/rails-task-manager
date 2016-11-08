class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    @task.save
  end

  def edit
  end

  def update
    @task.update(params_task)
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def set_task
   @task = Task.find(params[:id])
  end

  def params_task
    params[:task].permit(:name, :description, :subtasks)
  end
end
