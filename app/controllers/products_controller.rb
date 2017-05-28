class ProductsController < ApplicationController

before_action :validate_search_key, only: [:search]
before_filter :authenticate_user! , only: [:new, :edit, :create, :update, :destroy, :favorite]

   def index
     if params[:category].blank?
        @products = Product.where(:is_hidden => false)
        else
          @category_id = Category.find_by(name: params[:category]).id
          @products = Product.where(:category_id => @category_id, :is_hidden => false)
        end
   end


   def show
     @product = Product.find_by_friendly_id!(params[:id])
     if @product.is_hidden
      flash[:warning] = "This product already archived"
      redirect_to root_path
    end
   end

   def add_to_cart
     @product = Product.find_by_friendly_id!(params[:id])
     if !current_cart.products.include?(@product)
       current_cart.add_product_to_cart(@product)
       flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
     else
       flash[:warning] = "你的购物车内已有此物品"
     end
       redirect_to :back
   end

   def favorite
       @product = Product.find_by_friendly_id!(params[:id])
       type = params[:type]
       if type == "favorite"
       current_user.favorite_products << @product
       redirect_to :back

       elsif type == "unfavorite"
       current_user.favorite_products.delete(@product)
       redirect_to :back

       else
       redirect_to :back
       end
    end


   def search
     if @query_string.present?
       search_result = Product.ransack(@search_criteria).result(:distinct => true)
       @products = search_result.paginate(:page => params[:page], :per_page => 5 )
     end
   end

   protected

   def validate_search_key
     @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
     @search_criteria = search_criteria(@query_string)
   end

   def search_criteria(query_string)
     { :title_cont => query_string }
   end

end
