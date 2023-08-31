class TasksController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
    @task = Task.new(task_params)
    @task.user = current_user
    @task.property = @property
    if @task.save
      redirect_to property_path(@property)
    else
      # TODO: Render the modal with status on unprocesable entity
      render notice: "Failed! Try Again."
    end
  end

  def show
    @task = Task.find(params[:id])
    # TODO: Make sure that the task show page also show us the subtasks.
    @subtasks = @task.subtasks
    # empty subtask instance for creating a subtask.
    @subtask = Subtask.new
  end

  def update
    @task = Task.find(params[:id])
    @property = @task.property
    if @task.update(task_params)
      redirect_to property_path(@property)
    else
      render notice: "Failed! Try Again."
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @property = @task.property
    @task.destroy
    redirect_to property_path(@property), notice: "Task successfully removed!"
  end

  private

  def task_params
    params.require(:task).permit(:start_date, :completion_date, :title, :description)
  end
end
