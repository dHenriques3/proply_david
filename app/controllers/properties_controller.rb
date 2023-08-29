class PropertiesController < ApplicationController
  before_action :set_property

  def index
    @properties = Property.all
  end

  def show
    @property = Property.new
  end

end
