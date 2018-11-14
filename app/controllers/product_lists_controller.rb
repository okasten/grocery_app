class ProductListsController < ApplicationController
  before_action :find_user

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
    @product_list = @user.lists.find(params[:product_list][:list_id]).product_list.build(product_list_params)
    if @product_list.save
      redirect_to user_product_path(@user)
    else
      render user_product_path(@user)
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
