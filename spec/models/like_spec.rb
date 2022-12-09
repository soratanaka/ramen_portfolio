require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop)
    @second_shop = FactoryBot.create(:second_shop)
    @like = FactoryBot.create(:like, user_id: @user.id, shop_id: @shop.id)
    sleep 0.2
  end

  describe 'いいね機能' do
    context 'いいねできる場合' do
      it "user_idとshop_idがあれば保存できる" do
        expect(@like).to be_valid
      end

      it "shop_idが同じでもuser_idが違えばいいねできる" do
        another_like = FactoryBot.create(:like, user_id: @second_user.id, shop_id: @shop.id)
        expect(another_like).to be_valid
      end

      it "user_idが同じでもshop_idが違えばいいねできる" do
        another_like = FactoryBot.create(:like, user_id: @user.id, shop_id: @second_shop.id)
        expect(another_like).to be_valid
      end
    end
  end
end