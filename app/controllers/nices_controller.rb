class NicesController < ApplicationController
  nice = current_user.nices.create(post_id: params[:post_id])
  redirect_to posts_path, notice: "#{nice.post.user.name}を気になる登録しました"
end

def destroy
  nice = current_user.nices.find_by(id: params[:id]).destroy
  redirect_to posts_path, notice: "#{nice.post.user.name}を気になる登録解除しました"
end
end
