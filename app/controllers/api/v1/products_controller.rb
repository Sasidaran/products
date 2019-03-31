class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all
    json_response(@products)
  end

  # POST /products
  def create
    @product = Product.create(product_params)
    @product.categories.build(product_params[:categories])
    #@product.attachments.build(product_params[:attachments])
    @product.save
    json_response(@product, :created)
  end

  # GET /products/:id
  def show
    json_response(@product)
  end

  # PUT /products/:id
  def update
    @product.update(product_params)
    head :no_content
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    head :no_content
  end

  private

  def product_params
    # whitelist params
    params.permit(:name, :sku_id, :description, :price, :expire_date, categories: [:name], attachments: [:img_path])
  end

  def set_product
    @product = Product.find_by_id(params[:id])
  end
end
