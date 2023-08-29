class TasksController < ApplicationController
  def create
    property = Property.find(params[:property_id])
    @task = Task.new(task_params)
    @task.user = current_user
    @task.property = property
    if @task.save
      redirect_to property_path(property)
    else
      # need to figure out how  to render the modal with status on unprocesable entity
      render notice: "Failed! Try Again."
    end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:start_date, :completion_date, :title, :description)
  end

end
