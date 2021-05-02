class ReservationsController < ApplicationController
  def index
    @users = User.all
    @rooms = Room.all
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
  end

  def new
  end

  def create!
    @reservation = current_user.reservations.create(reservation_params)
    redirect_to root_path notice:"予約を完了しました。"
  end

  def show
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :user_id)
  end

end
