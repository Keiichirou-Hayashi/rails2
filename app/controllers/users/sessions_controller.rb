# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]
   before_action :set_search_header, only: [:new]

   def set_search_header
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
   end

   #GET /resource/sign_in
    #def new
    # super
    #end

   #POST /resource/sign_in
   #def create
   #  super
   #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
