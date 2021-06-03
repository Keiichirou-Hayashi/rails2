class UsersController < ApplicationController

 

  def index
    @search = User.ransack(params[:search])
    @users = @search.result(distinct: true)
    @rooms = Room.all
  end

  def new
    @user = User.new
    @room = Room.new
  end

  def create
  end

  def edit
    @room = Room.find(params[:id])
  end

  def show
  end

  def account
  end

  def update
  end

  def destroy
  end

  def search
    @rooms = Room.all
    @q = User.search(search_params)
    @students = @q.result(distinct: true)
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

end
