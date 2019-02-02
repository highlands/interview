class ProductPropertiesController < ApplicationController
  before_action :set_product_property, only: [:show, :edit, :update, :destroy]

  # GET /product_properties
  # GET /product_properties.json
  def index
    @product_properties = ProductProperty.all
  end

  # GET /product_properties/1
  # GET /product_properties/1.json
  def show
  end

  # GET /product_properties/new
  def new
    @product_property = ProductProperty.new
  end

  # GET /product_properties/1/edit
  def edit
  end

  # POST /product_properties
  # POST /product_properties.json
  def create
    @product_property = ProductProperty.new(product_property_params)

    respond_to do |format|
      if @product_property.save
        format.html { redirect_to @product_property, notice: 'Product property was successfully created.' }
        format.json { render :show, status: :created, location: @product_property }
      else
        format.html { render :new }
        format.json { render json: @product_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_properties/1
  # PATCH/PUT /product_properties/1.json
  def update
    respond_to do |format|
      if @product_property.update(product_property_params)
        format.html { redirect_to @product_property, notice: 'Product property was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_property }
      else
        format.html { render :edit }
        format.json { render json: @product_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_properties/1
  # DELETE /product_properties/1.json
  def destroy
    @product_property.destroy
    respond_to do |format|
      format.html { redirect_to product_properties_url, notice: 'Product property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_property
      @product_property = ProductProperty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_property_params
      params.require(:product_property).permit(:value, :product_id, :property_id)
    end
end
