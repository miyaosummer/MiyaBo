class ConfigsController < ApplicationController

  def index
    if user_signed_in?
      @users = User.find(current_user.id)
    end
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
