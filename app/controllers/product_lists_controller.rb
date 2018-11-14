class ProductListsController < ApplicationController
  before_action :find_user, except: [:create]

  def index
    @lists = @user.lists
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @product_list = ProductList.new
  end

  def create
    # @product = Product.find(params[:product_list][:product_id])
    @product_list = ProductList.new(product_list_params)
    byebug
    if @product_list.save
      redirect_to user_product_lists_path
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def product_list_params
    params.require(:product_list).permit(:list_id, :store_id, :product_id, :product_amount)
  end
end
