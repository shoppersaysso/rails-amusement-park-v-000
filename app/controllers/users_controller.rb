class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'users', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'welcome', action: 'index'
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

 private

 def user_params
   params.require(:user).permit(:name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets, :admin)
 end


end
