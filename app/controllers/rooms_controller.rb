class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @users = User.all
  end

  def search
  end

  def new
    @room = Room.new
    @user = User.new
   end

  def create
    @room = Room.new(params.require(:room).permit(:room_name, :introduction, :price, :address, :room_image))
    if @room.save
      flash[:notice] = "ルームを登録しました。"
      redirect_to :rooms
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @room = Room.find(params[:id])
    @user = User.find(params[:id])
    @rooms = @user.username
  end

  def posts
    @rooms = Room.all
  end

  def update
  end

  def destroy
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = User.ransack(params[:q])
  end

end