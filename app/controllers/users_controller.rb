class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      render json: {status: 'CREATED', message: 'User created'}
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
end
