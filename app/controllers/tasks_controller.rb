class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @to_do = current_user.tasks.where(state: "to do")
    @doing = current_user.tasks.where(state: "doing")
    @done = current_user.tasks.where(state: "done")
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = Task.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = current_user.tasks.new(content: params[:task][:content], state: params[:state])
    @task.save
    respond_with(@task)
  end

  def update
    @task.update(task_params)
    respond_with(@task)
  end

  def destroy
    @task.destroy
    respond_with(@task)
  end

  def change
  end



  private
    def set_task
      @task = Task.find(params[:id])
    end

end
