class UsersController < ApplicationController

  before_action :set_q, only: [:index, :serach]

  def index
    @users = User.all
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
    @user = User.new
  end

  def account
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
