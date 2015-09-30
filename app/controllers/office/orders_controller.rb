class Office::OrdersController < ApplicationController
  access_control do
    # allow all
    allow :developers
  end

  before_action :set_office_order, only: [:show, :edit, :update, :destroy]

  # GET /office/orders
  # GET /office/orders.json
  def index
    @document_types = Office::DocumentType.for_orders

    @orders = Office::Order.with_document_type(params[:document_type_id])
  end

  # GET /office/orders/1
  # GET /office/orders/1.json
  def show
  end

  # GET /office/orders/new
  def new
    @office_order = Office::Order.new
  end

  # GET /office/orders/1/edit
  def edit
  end

  # POST /office/orders
  # POST /office/orders.json
  def create
    @office_order = Office::Order.new(office_order_params)

    respond_to do |format|
      if @office_order.save
        format.html { redirect_to @office_order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @office_order }
      else
        format.html { render :new }
        format.json { render json: @office_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office/orders/1
  # PATCH/PUT /office/orders/1.json
  def update
    respond_to do |format|
      if @office_order.update(office_order_params)
        format.html { redirect_to @office_order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_order }
      else
        format.html { render :edit }
        format.json { render json: @office_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office/orders/1
  # DELETE /office/orders/1.json
  def destroy
    @office_order.destroy
    respond_to do |format|
      format.html { redirect_to office_orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_order
      @office_order = Office::Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_order_params
      params[:office_order]
    end
end
