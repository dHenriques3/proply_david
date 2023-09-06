class SubtasksController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @property = @task.property
    @subtask = Subtask.new(subtask_params)
    @subtask.task = @task
    if @subtask.save
      redirect_to property_task_path(@property, @task)
    else
      redirect_to property_task_path(@property, @task), notice: "Failed to create the subtask. Try Again!"
    end
  end

  def update
    @subtask = Subtask.find(params[:id])
    @property = @subtask.task.property
    if params[:completed].present?
      @subtask.completed = params[:completed]
    end
    if @subtask.save!
      redirect_to property_path(@property), notice: "Subtask Updated!"
    else
      redirect_to property_path(@property), notice: "Subtask Update Failed!"
    end
  end

  def destroy
    @subtask = Subtask.find(params[:id])
    @task = @subtask.task
    @property = @task.property

    if @subtask.destroy
      redirect_to property_task_path(@property, @task), notice: "Subtask Deleted!"
    else
      redirect_to property_task_path(@property, @task), notice: "Failed To Delete Subtask!"
    end
  end

  private

  def subtask_params
    params.require(:subtask).permit(:start_date, :completion_date, :title,
                                    :description, :completed)
  end
end
