class TopsController < ApplicationController

  def index
    if user_signed_in?
      @users = User.find(current_user.id)
    end
    @incomes = Income.all
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
