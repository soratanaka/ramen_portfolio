class NicesController < ApplicationController
  def create 
    nice = current_user.nices.create(post_id: params[:post_id])
    redirect_to post_path(nice.post.id), notice: "#{nice.post.user.name}さんの投稿にいいねしました"
  end

  def destroy
    nice = current_user.nices.find_by(id: params[:id]).destroy
    redirect_to post_path(nice.post.id), notice: "#{nice.post.user.name}をんの投稿にいいねを解除しました"
  end
end
