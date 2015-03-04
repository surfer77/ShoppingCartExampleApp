class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy ]
	before_action :authenticate_user!, except: [:index, :show]
 
  def index
    @products = Product.all
    @order_item = current_order.order_items.new
  end
  
  def show
		@random_product = Product.where.not(id: @product).order("RANDOM()").first
	end

	def new
		@product = current_user.products.build
	end

	def create
		@product = current_user.products.build(product_params)

		if @product.save
			redirect_to @product
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @product.update(product_params)
			redirect_to @product
		else
			render 'edit'
		end
	end

	def destroy
		@product.destroy
		redirect_to root_path
	end


	private

	def find_product
		@product = Product.find(params[:id])
	end

	def product_params
		params.require(:product).permit(:name, :price, :description, :image)
	end
end
