class AssetsController < ApplicationController

  def create
    asset = Asset.new
    asset.assetable_type = params[:assetable_type]
    asset.assetable_id = params[:assetable_id]
    asset.file = params[:photo][:image]
    if asset.save
      render :partial => "assets/asset", :locals => {:asset => asset}
    else
      render :text => {succsess: false}.to_json
    end
  end

  def destroy
    if Asset.find(params[:id]).destroy
      render :text => "{succsess:true}"
    else
      render :text => 404
    end
  end
	
end
