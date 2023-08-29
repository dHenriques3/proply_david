class DocumentsController < ApplicationController
  def create
    @property = Property.find(params[:property_id])
    @document = Document.new(document_params)
    @document.property = @property # connects a document to a property
    if @document.save
      redirect_to property_path(@property) # redirecting to property show page.
    else
      render 'properties/show', notice: 'Your document was not created. Try Again. '
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :document_type, :certification_date)
  end
end
