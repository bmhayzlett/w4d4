class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email_address],
              params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:error] = "WRONG LOGIN INFORMATION"
      render :new
    end
  end

  def destroy
    @user = self.current_user
    if @user
      @user.reset_session_token!
      @user = nil
      session[:token] = nil
      redirect_to new_session_url
    end

  end

end
