
class UsersController < ApplicationController
  require 'debug'

  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Account information successfully updated!"
      redirect_to articles_path
    else
      render 'edit'
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome #{@user.username}! You have successfully signed up!"
      redirect_to articles_path
    else
      render 'new'
  end
end

private
def user_params
  params.require(:user).permit(:username, :email, :password)
end



end