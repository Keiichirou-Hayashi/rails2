class ReservationsController < ApplicationController

  before_action :set_search_header, only: [:index, :new, :posts, :show]

  def index
    @users = User.all
    @room = Room.find(params[:id])
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create!
    @reservation = Reservation.new(reservation_params)
    @room = Room.find(params[:id])
    if @reservation.save
      flash[:notice] = "予約を完了しました"
      redirect_to room_reservation_path(@room.id)
    else
      render 'new'
    end
  end

  def update
  end

  def show
    @room = Room.find(params[:id])
  end

  private

  def set_search_header
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :confirming)
  end

end
