class PropertiesController < ApplicationController
  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to property_path(@property), notice: "Propertie was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def destroy
      @property.destroy
      redirect_to properties_url, notice: "Propertie was successfuly deleted!"
  end


  private

  def property_params
    params.require(:property).permit(:name, :type, :address, :description)

  end
end
