class TopsController < ApplicationController

  def index
    @users = User.find(current_user.id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
end
