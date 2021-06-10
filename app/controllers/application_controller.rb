class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  autocomplete :user, :username, full: true
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_search
    @users = User.all
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
  end

  protected
    def configure_permitted_parameters
      added_attrs = [ :username, :email, :password, :password_confirmation ]
      if resource_class == User
        devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :acount_update, keys: added_attrs
      end
    end

  
end
