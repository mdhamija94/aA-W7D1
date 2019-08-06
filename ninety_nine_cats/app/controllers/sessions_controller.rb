class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(params[:users][:user_name], params[:users][:password])

    if user
      login(user)
      redirect_to cats_url
    else 
      flash.now[:errors] = ["You done messed up"]
      render :new
    end

  end

  def destroy
    logout
  end



end
