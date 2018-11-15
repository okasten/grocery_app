class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user(@user)
      redirect_to @user
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to new_user_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
