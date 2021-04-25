class UsersController < ApplicationController
  def index
    @usens = User.all
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
