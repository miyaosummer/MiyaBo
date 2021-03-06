class IncomesController < ApplicationController

  def index
    @incomes = Income.all
  end

  def new
    @user = User.find(current_user.id)
    @income = Income.new
    @junres = Junre.all
  end

  def show
    @income = Income.find(params[:id])
  end

  def create
    Income.create(income_parameter)
    redirect_to root_path
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to root_path, notice:"削除しました"
  end

  def edit
    @user = User.find(current_user.id)
    @income = Income.find(params[:id])
    @junres = Junre.all
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(income_parameter)
      redirect_to root_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def income_parameter
    params.require(:income).permit(:name, :money, :start_time).merge(user_id: current_user.id)
  end

end
