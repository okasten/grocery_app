class ListsController < ApplicationController

  before_action :find_user, only: [:index, :new, :create, :show, :products_search]
  def index
    @lists = @user.lists
  end

  def new
    @list = List.new
  end

  def create
    @list = @user.lists.build(list_params)
    if @list.save
      redirect_to user_lists_path
    else
      render :new
    end
  end


  def show
    @list = List.find(params[:id])
    # byebug
  end

  def products_search
    # byebug
    @stores = @user.stores
    @product_list = ProductList.new
    @list = List.find(params[:list_id])
    @product_name = params[:product]
    @products = Product.where("name LIKE ?", "%#{@product_name}%")
  end

  private
  def list_params
    params.require(:list).permit(:name, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
