class AssetsController < ApplicationController

  def index

  end

  def new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @asset = Asset.new
    @junres = Junre.all
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      redirect_to new_user_asset_path
      flash[:succes] = "#{@asset.name}の予算を#{@asset.money}円に設定しました。"
    else
      render action: :new
      flash[:succes] = "設定に失敗しました。"
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy

  end

  private

  def asset_params
    params.require(:asset).permit(:name,:money,:comment).merge(user_id: current_user.id)
  end
  
end
