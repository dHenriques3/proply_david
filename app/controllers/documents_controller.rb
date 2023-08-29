class DocumentsController < ApplicationController
  def create
    @document = Document.new(document_params)
    @document.user = current_user
    if @document.save
      redirect_to documents_path
    else
      render :new, status: :unprocessable_entity, alert: 'Your document was not created. Try Again. '
    end
  end

  private

  def document_params
    params.require(:document).permit(:title, :document_type, :certification_date)
  end
end
