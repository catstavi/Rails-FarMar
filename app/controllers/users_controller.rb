class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(params.require(:user).permit(:username))
  end
  
end
