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

    if !params[:list_id]
      @product = Product.find(params[:product_list][:product_id])
      @product_list = @user.lists.find(params[:product_list][:list_id]).product_list.build(product_list_params)
      if @product_list.save
        redirect_to user_product_path(@user, @product)
      else
        
        redirect_to user_product_path(@user, @product)
      end
    else
      @product = Product.find(params[:product_list][:product_id])
      @product_list = @user.lists.find(params[:list_id]).product_list.build(add_item_params)
      @list = List.find(params[:list_id])
      if @product_list.save
        redirect_to user_list_path(@user, @list)
      else
        render user_lists_path(@user)
      end
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def add_item_params
    {list_id: params[:list_id], product_id: params[:product_list][:product_id], product_amount: params[:product_list][:product_amount], store_id: params[:product_list][:store_id]}
  end

  def product_list_params
    params.require(:product_list).permit(:list_id, :store_id, :product_id, :product_amount)
  end
end
