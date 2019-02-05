class Products::ProductPropertiesController < ApplicationController

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
    @product = Product.find(params[:product_id])
    @product_property = ProductProperty.new
    
    #https://gorails.com/forum/how-do-i-create-a-parent-record-from-the-child-when-the-parent-doesn-t-exist
    @product_property.build_property
  end

  # GET /product_properties/1/edit
  def edit
  end

  # POST /product_properties
  # POST /product_properties.json
  def create
    @product = Product.find(params[:product_id])
    @product_property = ProductProperty.new(product_property_params)
    @product_property.product = @product
    
    #https://gorails.com/forum/how-do-i-create-a-parent-record-from-the-child-when-the-parent-doesn-t-exist
    if params[:product_product_property][:property_name]
      parent_property = @properties.find_or_create_by(name: params[:product_property][:property_name])
      @product_property.property = parent_property
    end

    respond_to do |format|
      if @product_property.save
        @property = @product_property.property
        format.html { redirect_to @product, notice: 'Product property was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
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
      params.require(:product_property).permit(:value, :product_id, :property_id, property_attributes: [:name, :id])
    end
end
