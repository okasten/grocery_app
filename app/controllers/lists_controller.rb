class ListsController < ApplicationController

  before_action :find_user, only: [:index, :new, :create]
  def index
    @lists = List.all
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
  end

  private
  def list_params
    params.require(:list).permit(:name, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end
end
