class RoomsController < ApplicationController


  def index
    @rooms = Room.all
    @users = User.all
  end

    def search
      @rooms = Room.all
      @q = User.search(search_params)
      @students = @q.result(distinct: true)
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

  def set_search_header
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
  end

  def search_params
    params.require(:q).permit!
  end

  def room_params
    params.require(:room).permit(:room_name, :introduction, :price, :address, :room_image)
  end

end