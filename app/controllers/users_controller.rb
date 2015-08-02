class UsersController < ApplicationController

  before_action :auth_user!, except: [:new, :create]

  def auth_user!
    @user_id = session[:user_id]
    @current_user = User.find_by id: @user_id

    if @current_user.nil?
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end


  def create
    @user = User.new params.require(:user).permit(:username, :email, :password, :password_confirmation, :first_name, :last_name)
      @user.save
      redirect_to root_path
  end


  def destroy
    session.delete :user_id
    redirect_to index_path
  end




end
