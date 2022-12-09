require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'ユーザー登録' do
    it "ユーザー登録できること" do
      @user = FactoryBot.create(:user)
      expect(@user).to be_valid  # user.valid? が true になればパスする
    end
  end
end