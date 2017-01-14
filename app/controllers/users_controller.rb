class UsersController < ApplicationController
  before_action :user_logged_in, only: [:edit, :update]
  before_action :user_belongs, only: [:edit, :update]

  def new
    @user = User.new
  end

  #def show
  #  @user = User.find(params[:id])
  #end

  def create
    @user = User.new(permitted_params)
    if @user.save
      log_in @user
      #redirect_to user_url(@user)
      redirect_to root_url
    else
      render 'new';
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(permitted_params)
      flash[:success] = "Update successful"
      redirect_to root_url
    else
      render 'edit'
    end
  end


  def user_belongs
    unless User.find(params[:id]) == cur_user
      redirect_to root_url
    end
  end

  def permitted_params
    params.require(:user).permit(:battletag, :email, :password, :password_confirmation)
  end
end
