class ProductsController < ApplicationController
  # Only asks for authentication if attempting to post
  before_action :authenticate_user!, except: %i[ show index ]
  before_action :set_product, only: %i[ show ]
  before_action :set_user_product, only: %i[ update edit destroy ]
  before_action :set_categories_and_conditions, only: %i[ new edit ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    puts current_user.email
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_user_product
      @product = current_user.products.find_by_id(params[:id])
      if @product == nil
        flash[:alert] = "That is not your product"
        redirect_to products_path
      end
    end

    def set_categories_and_conditions
      @categories = Category.all
      @conditions = Product.conditions.keys
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :picture, :category_id, :description, :price, :condition)
    end
end
