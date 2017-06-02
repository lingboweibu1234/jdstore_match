class Admin::ProductsController < ApplicationController
layout "admin"
before_action :authenticate_user!
before_action :admin_required
  def index
    if params[:category].blank?
      @products = Product.all.paginate(:page => params[:page], :per_page => 5)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(:category_id => @category_id).paginate(:page => params[:page], :per_page => 5)
    end
  end
  def new
    @product = Product.new
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def edit
    @product = Product.find_by_friendly_id!(params[:id])
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def update
    @product = Product.find_by_friendly_id!(params[:id])
    @product.category_id = params[:category_id]
     if @product.update(product_params)
       redirect_to admin_products_path
     else
       render :edit
     end
   end
  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end
  def destroy
    @product = Product.find_by_friendly_id!(params[:id])
    @product.destroy
    redirect_to :back
  end
  def publish
    @product = Product.find_by_friendly_id!(params[:id])
    @product.publish!

    redirect_to :back
  end

  def hide
    @product = Product.find_by_friendly_id!(params[:id])
    @product.hide!

    redirect_to :back
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :category_id, :is_hidden)
  end

end
