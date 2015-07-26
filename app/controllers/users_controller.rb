class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = "New User Created"
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.first
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update
      flash[:success] = "User Updated"
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User Deleted"
      redirect_to index
    else
      flash[:error] = @user.errors.full_messages.first
      render :edit
    end
  end

  private

  def whitelisted_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
