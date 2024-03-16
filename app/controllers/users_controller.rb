class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET http://localhost:3000/users/id
  def show
    # Find the user by the ID provided in the params
    user = User.find(params[:id])

    # Respond with the user data in JSON format
    render json: user
  rescue ActiveRecord::RecordNotFound
    # If no user is found with the given ID, return a 404 Not Found response
    render json: { error: 'User not found' }, status: :not_found
  end

  def new
    user = User.new
  end

  # POST http://localhost:3000/users
  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PUT http://localhost:3000/users/id
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE http://localhost:3000/users/id
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
  rescue ActiveRecord::RecordNotFound
  end

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
  end
end
