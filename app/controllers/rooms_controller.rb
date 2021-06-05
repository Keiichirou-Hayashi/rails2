class RoomsController < ApplicationController


  def index
    @rooms = Room.all
    @users = User.all
  end

  def search
    @users = User.all
    @q = Room.search(search_params)
    @rooms = @q.result(distinct: true)
  end

  def new
    @room = Room.new
    @user = User.new
  end 

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "新規登録しました"
      redirect_to user_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find_by(oarams[:user_id])
    @room = Room.find_by(params[:room_id])
  end

  def posts
    @rooms = Room.all
    @users = User.all
  end

  def update
  end

  def destroy
  end



  private

  def search_params
    params.require(:q).permit(:address_cont, :room_name_or_introduction_or_address_cont)
  end

  def room_params
    params.require(:room).permit(:room_name, :introduction, :price, :address, :room_image)
  end

end