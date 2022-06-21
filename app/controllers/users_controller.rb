class UsersController < ApplicationController
  
  def index
    @users = User.all
  end 
  
  def new                #sign up form
    @user = User.new
  end
  
  def create             #recieve form and create user
    @user = User.new(user_params)
    # @user = User.where(id: params[:id])
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/',  notice: 'user successfully created!'
    else
      redirect_to '/signup'
    end
  end
  
  private
  def user_params
    params.require(:user).permit(
      :firstname, :lastname, :email, :password, :password_confirmation
    )
  end

end
