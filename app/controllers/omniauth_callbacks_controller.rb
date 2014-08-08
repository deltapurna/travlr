class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    # render json: request.env["omniauth.auth"] and return
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
    else
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_path
    end
  end
end
