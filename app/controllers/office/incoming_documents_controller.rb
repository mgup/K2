class Office::IncomingDocumentsController < ApplicationController
  respond_to :html

  load_and_authorize_resource :document_type, class: 'Office::DocumentType'
  load_and_authorize_resource through: :document_type, shallow: true

  def index
    @document_types = Office::DocumentType.for_incoming_documents

    if params[:q]
      @incoming_documents = find_incoming_documents_by_query
    else
      @incoming_documents = @incoming_documents
                              .with_document_type(params[:document_type_id])
                              .page(params[:page])
    end
  end

  def new
  end

  def edit
    @document_type = @incoming_document.document_type
  end

  def create
    if @incoming_document.save
      respond_options = {
        location: -> {
          office_document_type_incoming_documents_path(@incoming_document.document_type)
        }
      }
      respond_with @incoming_document, respond_options
    else
      render :new
    end
  end

  def update
    if @incoming_document.update(incoming_document_params)
      respond_options = {
        location: -> {
          office_document_type_incoming_documents_path(@incoming_document.document_type)
        }
      }
      respond_with @incoming_document, respond_options
    else
      render :edit
    end
  end

  def destroy
    @incoming_document.destroy
    respond_to do |format|
      format.html do
        redirect_to office_document_type_incoming_documents_path(@incoming_document.document_type),
                    notice: 'Документ успешно удалён.'
      end
    end
  end

  def position
    @number = params[:number].to_i
    @incoming_documents = @document_type.incoming_documents
                .where('number >= ?', @number - 1)
                .where('number <= ?', @number + 1)

    respond_to do |format|
      format.html do
        render layout: false
      end
    end
  end

  private

  def incoming_document_params
    params.require(:office_incoming_document).permit(incoming_document_attributes)
  end

  def incoming_document_attributes
    [:document_type_id, :number, :suffix, :date, :title, :document]
  end

  def find_incoming_documents_by_query
    search = @incoming_documents.search do
      fulltext params[:q]
      paginate page: params[:page]

      order_by(:number, :desc)
      order_by(:suffix, :desc)
    end

    search.results
  end
end
