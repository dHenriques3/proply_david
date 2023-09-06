class DocumentsController < ApplicationController
  def index
    @properties = Property.where("user_id = ?", current_user.id)
  end

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

  def update
    @document = Document.find(params[:id])
    @property = @document.property
    if @document.update(document_params)
      redirect_to documents_path, notice: "Your document was updated successfully."
    else
      redirect_to documents_path, notice: "Your document failed to update."
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @property = @document.property
    if @document.destroy
      redirect_to documents_path, notice: "Document successfully removed!"
    else
      redirect_to documents_path, notice: "Failed to remove document!"
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :document_type, :certification_date, :file)
  end
end
