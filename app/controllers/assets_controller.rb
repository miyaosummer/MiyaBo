class AssetsController < ApplicationController

  def index

  end

  def new
    @asset = Asset.new
    @junres = Junre.all
  end

  def create
    @asset = Asset.new(asset_params)
    if @asset.save
      redirect_to new_asset_path
      alert[:succes] = "#{@asset.name}の予算を#{@asset.money}に設定しました。"
    else
      render action: :new
      alert[:succes] = "設定に失敗しました。"
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
