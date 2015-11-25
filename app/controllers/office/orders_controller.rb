# Контроллер для работы с приказами, которые регистрирует Общий отдел.
class Office::OrdersController < ApplicationController
  respond_to :html

  load_and_authorize_resource

  before_action :set_order, only: [:edit, :update, :destroy]
  before_action :set_document_type, only: [:new, :create]

  def index
    @document_types = Office::DocumentType.for_orders

    if params[:q]
      @orders = find_orders_by_query
    else
      @orders = Office::Order.with_document_type(params[:document_type_id])
                .page(params[:page])
    end
  end

  # GET /office/orders/new
  def new
    @order = @document_type.orders.build
  end

  # GET /office/orders/1/edit
  def edit
    @document_type = @order.document_type
  end

  # POST /office/orders
  # POST /office/orders.json
  def create
    @order = Office::Order.new(order_params)

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
      @document_type = @order.document_type

      render :edit
    end
  end

  # DELETE /office/orders/1
  # DELETE /office/orders/1.json
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
    @orders = Office::Order
              .where('number >= ?', @number - 1)
              .where('number <= ?', @number + 1)

    respond_to do |format|
      format.html do
        render layout: false
      end
    end
  end

  private

  def set_order
    @order = Office::Order.find(params[:id])
  end

  def set_document_type
    @document_type = Office::DocumentType.find(params[:document_type_id])
  end

  def order_params
    params.require(:office_order).permit(:document_type_id, :number, :suffix,
                                         :date, :title, :document)
  end

  def find_orders_by_query
    search = Office::Order.search do
      fulltext params[:q]
      paginate page: params[:page]

      order_by(:number, :desc)
      order_by(:suffix, :desc)
    end

    search.results
  end
end
