class UsersController < ApplicationController
  def new
    
  end

  def create
    @user = User.new(permitted_user_param)

    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def permitted_user_param
    params.require(:user).permit(:username, :email, :password)
  end
end
