class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user

  def current_user
    @current_user = if authenticate_with_http_token { |t| t }
                      User.find_by(auth_token: authenticate_with_http_token {|t| t})
                    elsif user = authenticate_with_http_basic {|u,p| User.find_by(email: u)}
                      user.authenticate(authenticate_with_http_basic {|u,p| p })
                    elsif token = Doorkeeper.authenticate(request)
                      User.find(token.resource_owner_id) if token.accessible?
                    else
                      User.
                        find(session[:user_id]) if session[:user_id]
                    end
  end

  def authorize
    respond_to do |format|
      format.html { redirect_to new_session_path, 
        alert: "Unauthorized Access" unless current_user }
      format.json { render json: "Unauthorized Access", status: 401 unless current_user }
    end
  end
end
