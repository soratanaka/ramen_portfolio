require 'rails_helper'

RSpec.describe Shop, type: :model do
    describe 'ショップ登録' do
    it "店舗情報が登録できること" do
      user = FactoryBot.create(:user)
      shop = FactoryBot.create(:shop, user_id: @user)
      expect(shop).to be_valid  # user.valid? が true になればパスする
    end
  end
end