class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :check_user, only: [:edit, :update, :destroy]

  # GET http://localhost:3000/users/new
  def new
    @user = User.new
  end

  # POST http://localhost:3000/users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    if @user.destroy
      redirect_to users_url, notice: 'Profile was successfully deleted.'
    else
      redirect_to users_url, alert: 'Profile could not be deleted.'
    end
  end
  

  private
  def set_user
    @user = User.find(params[:id])
  end



  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
  end
end
