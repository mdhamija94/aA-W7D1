class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to cats_url
    else
      render json: user.errors.full_messages
    end
  end

  private

  def user_params
    params.require(:users).permit(:user_name, :password)
  end
end
