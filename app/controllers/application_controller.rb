class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  autocomplete :user, :username, full: true

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

end
