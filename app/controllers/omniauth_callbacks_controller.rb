class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = Usuario.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    end
  end

  def google_oauth2
    @user = Usuario.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    end
  end

  def failure
    redirect_to root_path
  end

end
