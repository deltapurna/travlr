class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    respond_to do |format|
      if user && user.authenticate(params[:password])
        format.html do
          session[:user_id] = user.id
          redirect_to root_path, notice: "Logged In!"
        end
        format.json { render json: user }
      else
        format.html do
          flash.now.alert = "Invalid email or password"
          render :new
        end
        format.json { render json: "Invalid email or password" }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
