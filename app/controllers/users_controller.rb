class UsersController < ApplicationController

  before_action :set_search, only: [:index, :serach, :show]
  before_action :set_search_header, only: [:index, :show, :search, :account]

  def index
    @users = User.all
    @rooms = Room.all
    @users = @search.result(distinct: true)
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

  def set_search
    @search = User.ransack(params[:q])
  end

  def set_search_header
    @search_header = User.ransack(params[:q])
    if @search_header
      @users = @search_header.result(distinct: true)
    end
  end

end
