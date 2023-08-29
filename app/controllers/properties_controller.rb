class PropertiesController < ApplicationController
  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.user = current_user
  end

  private

  def property_params
    params.require(:property).permit(:name, :type, :address, :description)
  end
end
