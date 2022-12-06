class LikesController < ApplicationController
  def create
    like = current_user.likes.create(shop_id: params[:shop_id])
    redirect_to shop_path(like.shop.id) , notice: "#{like.shop.name}を気になる登録しました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to shop_path(like.shop.id), notice: "#{like.shop.name}を気になる登録解除しました"
  end
end
