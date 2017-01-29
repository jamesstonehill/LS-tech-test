class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if sign_in_and_redirect @user
      flash[:notice] = "Successfully signed in with GitHub."
    else
      flash[:error] = "GitHub sign in did not work."
    end
  end
end
