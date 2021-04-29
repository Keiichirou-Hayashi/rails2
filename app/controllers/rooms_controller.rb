class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @users = User.all
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