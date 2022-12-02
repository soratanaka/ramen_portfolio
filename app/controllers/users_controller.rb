class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if Post.find_by(user_id:current_user.id)
      @posts = Post.where(user_id:current_user.id)
    end
    # byebug
  end

  private

  def user_params
    #ストロングパラメータで、名前とメールを受け取ることができるように設定しておく。
    params.require(:user).permit(:name, :email)
  end
end
