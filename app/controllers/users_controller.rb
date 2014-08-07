class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to root_path, notice: "Thanks for Signing up!" }
        format.json { render json: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors }
      end
    end
  end
end
