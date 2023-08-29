class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
    if @property.save
      redirect_to properties_path
    else
      render :new, status: :unprocessable_entity, message: "Something went wrong!"
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :property_type, :address, :description)
  end
end
