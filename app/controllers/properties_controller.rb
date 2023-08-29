class PropertiesController < ApplicationController
  def show
    @property = Property.find(params[:id])
    @task = Task.new
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to properties_path
    else
      render :new, status: :unprocessable_entity, alert: 'Your property was not created. Try Again. '
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :property_type, :address, :description)
  end
end
