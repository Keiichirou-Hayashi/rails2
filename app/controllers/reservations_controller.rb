class ReservationsController < ApplicationController

  before_action :set_search_header, only: [:index, :new, :posts, :show]

  def index
    @users = User.all
    @rooms = Room.all
  end

  def new
    @room = Room.find(params[:id])
  end

  def create!
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to root_path notice:"予約を完了しました。"
  end

  def update
  end

  def show
  end

  private

  def set_search_header
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id)
  end

end
