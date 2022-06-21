class UsersController < ApplicationController

  def index
    @users = User.all
  end 
  
  def new                #sign up form
    @user = User.new
  end
  
  # def create             #recieve form and create user
  #   @user = User.new(user_params)
  #   # @user = User.where(id: params[:id])
  #   if @user.save
  #     redirect_to [:users],  notice: 'user successfully created!'
  #   else
  #     redirect_to '/signup'
  # end
  
  # private
  # def user_params
  #   params.require(:user).permit(
  #     :name, :email, :password, :password_confirmation
  #   )
  # end

end
