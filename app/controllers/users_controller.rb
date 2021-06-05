class UsersController < ApplicationController
before_action :search_form, only: [:index, :show] 

  def index
  end

  def new
    @user = User.new
    @room = Room.new
  end

  def create
  end

  def edit
    @room = Room.find(params[:id])
  end

  def show
  end

  def account
  end

  def update
  end

  def destroy
  end

  private

  def search_form
    @users = User.all
    @q = Room.search(search_params)
    @rooms = @q.result(distinct: true)
  end

  def search_params
    params.permit(:address_cont, :room_name_or_introduction_or_address_cont)
  end

end
