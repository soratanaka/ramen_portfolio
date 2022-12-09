class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[ followings followers ]

  def show
    @user = User.find(params[:id])
    if Post.find_by(user_id:current_user.id)
      @posts = Post.where(user_id:current_user.id)
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
  end

  private

  def user_params
    #ストロングパラメータで、名前とメールを受け取ることができるように設定しておく。
    params.require(:user).permit(:name, :email)
  end
end
