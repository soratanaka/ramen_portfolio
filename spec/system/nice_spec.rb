require 'rails_helper'
RSpec.describe 'いいねテスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user_id: @user.id)
    @post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @second_post = FactoryBot.create(:post,user_id: @second_user.id, shop_id: @shop.id)
  end
  describe 'いいねボタン' do
    context '投稿詳細にいいねボタンが表示される' do
      it '自分の投稿にはいいねできない' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit post_path(@post.id)
        expect(page).not_to have_content "お気に入りする"
      end
      it 'いいねする' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit post_path(@second_post.id)
        click_on "お気に入りする"
        expect(page).to have_content "ユーザーさんの投稿にいいねしました"
      end
      it 'いいね解除する' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit post_path(@second_post.id)
        click_on "お気に入りする"
        click_on "お気に入り解除する"
        expect(page).to have_content "ユーザーをんの投稿にいいねを解除しました"
      end
    end
  end
end