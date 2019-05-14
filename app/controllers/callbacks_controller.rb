class CallbacksController < Devise::OmniauthCallbacksController
  def github
    user = User.from_omniauth(request.env["omniauth.auth"])    
    sign_in_and_redirect user
    flash[:notice] = t(:sign_in_message)
  end
end
