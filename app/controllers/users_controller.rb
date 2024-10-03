class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(permitted_user_param)
      redirect_to new_user_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @user = User.new()
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
