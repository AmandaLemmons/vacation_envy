class SessionController < ApplicationController
  def new
      @user = User.new
  end


  def create
    email = params[:email]
    password = params[:password]

    @user = User.find_by email: email
    if (@user) && (@user.authenticate password)
      session[:user_id] = @user.id
    else
      flash.now[:danger] = "Try again. Invalid email/password combination"
      render :new
    end
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to index_path
  end
end
