class UsersController < ApplicationController
  def index
    @rooms = Room.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    if @q_header
      @users = @q_header.result(distinct: true)
    end
  end

  def new
    @user = User.new
  end

  def create
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def account
  end

  def update
  end

  def destroy
  end

end
