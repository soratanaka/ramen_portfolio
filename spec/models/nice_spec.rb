require 'rails_helper'

RSpec.describe Nice, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user_id: @user.id)
    @post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @second_post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @nice = FactoryBot.create(:nice ,post_id: @post.id , user_id: @user.id)
  end
  describe '気になる機能' do
    context 'いいねできる場合' do
      it "ユーザーが店舗へ気になる登録できること" do
        expect(@nice).to be_valid 
      end

      it "post_idが同じでもuser_idが違えばいいねできる" do
        another_like = FactoryBot.create(:nice, user_id: @second_user.id, post_id: @post.id)
        expect(another_like).to be_valid
      end

      it "user_idが同じでもpost_idが違えばいいねできる" do
        another_like = FactoryBot.create(:nice ,post_id: @second_post.id , user_id: @user.id)
        expect(another_like).to be_valid
      end
    end
  end
end