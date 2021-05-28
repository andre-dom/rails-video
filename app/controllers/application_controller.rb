class ApplicationController < ActionController::Base
  def require_user_logged_in!
    redirect_to root_path if not user_signed_in?
  end
end
