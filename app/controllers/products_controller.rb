class ProductsController < ApplicationController
  before_action :find_company, except: [:index, :delete_image]
  before_action :find_product, only: [:edit, :update, :show, :destroy]
  
  def index
    @products = Product.all
  end
  
  def new
    @product = @company.products.build
  end
  
  def create
    @product = @company.products.build(product_params)
    if @company.save
      flash[:success] = "Product Added"
      redirect_to company_product_path(@company, @product)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @product.update(product_params)
      flash[:success] = "Product Updated"
      redirect_to company_product_path(@company, @product)
    else
      render :new
    end
  end
  
  def destroy
    flash[:success] = "Product Updated" if @product.destroy
    redirect_to company_products_path(@company)
  end
  
  def show
  end
  
  private
    def find_company
      @company = Company.find_by_id(params[:company_id])
      unless @company.present?
        flash[:danger] = "Company not found"
        redirect_to companies_path
      end
    end
    
    def find_product
      @product = @company.products.find_by_id(params[:id])
      unless @product.present?
        flash[:danger] = "Company not found"
        redirect_to company_products_path(@company)
      end
    end
    
    def product_params
      params.require(:product).permit(:id, :name, :discription, :price,
        :images_to_be_deleted, images: [])
    end
end
