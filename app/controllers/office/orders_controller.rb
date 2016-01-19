# Контроллер для работы с приказами, которые регистрирует Общий отдел.
class Office::OrdersController < ApplicationController
  respond_to :html

  load_and_authorize_resource :document_type, class: 'Office::DocumentType'
  load_and_authorize_resource through: :document_type, shallow: true

  def index
    @document_types = Office::DocumentType.for_orders

    if params[:q]
      @orders = find_orders_by_query
    else
      @orders = @orders.with_document_type(params[:document_type_id])
                       .page(params[:page])
    end
  end

  def new
  end

  def edit
    @document_type = @order.document_type
  end

  def create
    if @order.save
      respond_options = {
        location: -> { office_document_type_orders_path(@order.document_type) }
      }
      respond_with @order, respond_options
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      respond_options = {
        location: -> { office_document_type_orders_path(@order.document_type) }
      }
      respond_with @order, respond_options
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html do
        redirect_to office_document_type_orders_path(@order.document_type),
                    notice: 'Документ успешно удалён.'
      end
    end
  end

  def position
    @number = params[:number].to_i
    @orders = @document_type.orders
                            .where('number >= ?', @number - 1)
                            .where('number <= ?', @number + 1)

    respond_to do |format|
      format.html do
        render layout: false
      end
    end
  end

  private

  def order_params
    params.require(:office_order).permit(order_attributes)
  end

  def order_attributes
    [:document_type_id, :number, :suffix, :date, :title, :document]
  end

  def find_orders_by_query
    search = @orders.search do
      fulltext params[:q]
      paginate page: params[:page]

      order_by(:number, :desc)
      order_by(:suffix, :desc)
    end

    search.results
  end
end
