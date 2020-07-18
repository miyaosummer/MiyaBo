class AssetsController < ApplicationController

  def index
  end

  def new
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @asset = Asset.new
    @junres = Junre.all
    @assets = Asset.where(user_id: current_user.id)
  end

  def create
    @asset = Asset.new(asset_params)
    @@asset_record = Asset.find_by(name: @asset.name, user_id: current_user.id)

    if @@asset_record.blank?
      if @asset.save
        redirect_to new_user_asset_path
        flash[:succes] = "#{@asset.name}の予算を#{@asset.money}円に設定しました。"
      else
        redirect_to new_user_asset_path
        flash[:succes] = "設定に失敗しました。"
      end
    elsif @@asset_record.money == @asset.money 
        redirect_to new_user_asset_path
    else
        redirect_to new_user_asset_path
        flash[:succes] = "すでに設定されている項目です。予算額を変更したい時は、予算脇の変更ボタンから変更してください。"
    end
  end

  def edit
    asset = Asset.find(params[:id])
  end

  def update
    assets = Asset.find(parmas[:id])
    if assets.update(asset_params)
      redirect_to new_user_asset_path
      flash[:succes] = "#{@asset.name}の予算を#{@asset.money}円に変更しました。"
    else
      redirect_to new_user_asset_path
      flash[:succes] = "更新できませんでした。"
    end
      
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
