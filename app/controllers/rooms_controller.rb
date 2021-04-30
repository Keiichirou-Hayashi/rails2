class RoomsController < ApplicationController
  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result(distinct: true)
    @users = @q.result(distinct: true)
    if @q_header
      @users = @q_header.result(distinct: true)
    end
  end

  def search
  end

  def new
    @room = Room.new
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
  end

  def show
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

end