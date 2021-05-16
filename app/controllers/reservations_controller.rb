class ReservationsController < ApplicationController

  before_action :set_search_header, only: [:index, :new, :posts, :show, :create]

  def index
    @users = User.all
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
    @user = User.new
    @room = Room.new
    #@reservation = current_user.reservations.new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
    binding.pry
      flash[:notice] = "予約を完了しました"
      redirect_to user_room_reservation_path(id: @reservation.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:user_id])
    @room = Room.find(params[:room_id])
  end

  def update
  end

  private

  def set_search_header
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
  end

  def reservation_params
    params.permit(:user_id, :room_id, :start_date, :end_date, :number_of_people, :total_price,)
  end

end