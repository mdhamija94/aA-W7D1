class SessionsController < ApplicationController
  before_action :must_be_logged_out

  def new
  end

  def create
    user = User.find_by_credentials(params[:users][:user_name], params[:users][:password])

    if user
      login!(user)
      redirect_to cats_url
    else 
      flash.now[:errors] = ["These are not the droids you're looking for"]
      render :new
    end

  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end
end
