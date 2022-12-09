require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user_id: @user.id)
    @post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @second_post = FactoryBot.create(:second_post, user_id: @user.id, shop_id: @shop.id)
  end

  describe '新規投稿' do
    context '投稿できる場合' do
      it "新規投稿が登録できること" do
        expect(@post).to be_valid 
      end
    end

    context '投稿できない場合' do
      it "user_idが空ではいいねできない" do
        @post.user_id = nil
        expect(@post).not_to be_valid 
      end

      it "shop_idが空では投稿できない" do
        @post.user_id = nil
        expect(@post).not_to be_valid 
      end

      it "contentが空では投稿できない" do
        @post.content = nil
        expect(@post).not_to be_valid 
      end
    end
  end
end