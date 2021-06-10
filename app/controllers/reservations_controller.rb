class ReservationsController < ApplicationController

  #before_action :set_search, only: [:index, :serach, :new, :show]
  #before_action :set_search_header, only: [:index, :new, :posts, :show, :create]
  before_action :authenticate_user!

  def index
    @rooms = Room.all
    @reservations = Reservation.all
    @reservations = Reservation.includes(:room)
  end

  def new
    @room = Room.find_by(params[:room_id])
    @reservation = current_user.reservations.new
    redirect_to sign_in_path unless user_signed_in?
  end

  def create
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      flash[:notice]= "予約を完了しました"
      redirect_to user_room_reservation_path(id: @reservation.id)
    else
      render :new
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
    @reservations = Reservation.all
    @rooms = Room.all
  end

  def update
  end


  private


  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :total_price,).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end