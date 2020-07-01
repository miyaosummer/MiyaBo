class BudgetsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @budget = Budget.new
    @junres = Junre.all
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def create
    Budget.create(budgets_parameter)
    redirect_to root_path
  end

  def destroy
    @budget = Budget.find(params[:id])
    @budget.destroy
    redirect_to root_path, notice:"削除しました"
  end

  def edit
    @user = User.find(current_user.id)
    @budget = Budget.find(params[:id])
    @junres = Junre.all
  end

  def update
    @budget = Budget.find(params[:id])
    if @budget.update(budgets_parameter)
      redirect_to root_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def budgets_parameter
    params.require(:budget).permit(:name, :money,).merge(user_id: current_user.id)
  end
end
