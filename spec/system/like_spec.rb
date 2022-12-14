require 'rails_helper'
RSpec.describe 'お気に入りテスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user_id: @user.id)
    @post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @second_post = FactoryBot.create(:post,user_id: @second_user.id, shop_id: @shop.id)
  end
  describe 'お気に入りボタン' do
    context '店舗詳細にお気に入りボタンが表示される' do
      it 'お気に入りボタンする' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
        visit shop_path(@shop.id)
        click_on "お気に入りする"
        expect(page).to have_content "#{@shop.name}を気になる登録しました"
      end
      it 'お気に入りボタン解除する' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
        visit shop_path(@shop.id)
        click_on "お気に入りする"
        click_on "お気に入り解除する"
        expect(page).to have_content "#{@shop.name}を気になる登録解除しました"
      end
    end
  end
end