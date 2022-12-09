class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [ :show ]
  def show
    if user_signed_in?
      @nice = current_user.nices.find_by(post_id: @post.id)
    end
  end

  def new
    @post = Post.new
    @post.shop_id = params[:shop_id]
    # byebug
  end

  def edit
    @shop = params[:shop] 
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      # byebug
      if @post.save
        format.html { redirect_to shop_path(@post.shop_id), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_url(current_user.id), notice: "Post was successfully destroyed." }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :shop_id).merge(user_id:current_user.id)
  end
end
