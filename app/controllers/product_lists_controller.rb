class ProductListsController < ApplicationController

  before_action :find_user, only: [:index, :show, :new, :update]
  def index
    @user = User.find(params[:user_id])
    @lists = @user.lists
  end

  def show
    @user = User.find(params[:user_id])
    @list = List.find(params[:id])
  end

  def new
    @product_list = ProductList.new
  end

  def create
  end

  private
  def find_user
    @user = User.find(params[:user_id])
  end
end
