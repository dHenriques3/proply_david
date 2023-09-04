class PropertiesController < ApplicationController
  def index
    @properties = Property.all
    @property = Property.new
    # populating markers
    @markers = @properties.geocoded.map do |property|
      {
        lat: property.latitude,
        lng: property.longitude,
        marker_html: render_to_string(partial: "marker", locals: { property: property })
      }
    end
  end

  def show
    @property = Property.find(params[:id])
    # for creating a new task
    @task = Task.new
    # for creating a new document
    @document = Document.new

    @marker = {
      lat: @property.latitude,
      lng: @property.longitude,
      marker_html: render_to_string(partial: "marker", locals: { property: @property })
    }
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

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    if @property.update(property_params)
      redirect_to property_path(@property), notice: "Property was successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    redirect_to properties_path, notice: "Property was successfully deleted!"
  end

  private

  def property_params
    params.require(:property).permit(:name, :property_type, :address, :description, images: [])
  end
end
