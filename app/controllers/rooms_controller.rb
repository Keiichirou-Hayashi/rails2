class RoomsController < ApplicationController

  before_action :set_search_header, only: [:index, :new, :posts, :show, :create]

  def index
    @rooms = Room.all
    @users = User.all
    @search = Room.ransack(params[:q])
    @rooms = @search.result(distinct: true)
  end

  def search
  end

  def new
    @room = Room.new
  end 

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to controller: :users, action: :show, id: current_user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(params[:id])
  end

  def posts
    @rooms = Room.all
    @users = User.all
  end

  def update
  end

  def destroy
  end

  def search
    @results = @q.result
  end

  private

  def set_search_header
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
  end

  def room_params
    params.require(:room).permit(:room_name, :introduction, :price, :address, :room_image)
  end

end