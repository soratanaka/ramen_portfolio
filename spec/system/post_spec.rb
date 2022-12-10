require 'rails_helper'
RSpec.describe '投稿テスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user_id: @user.id)
    @post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @second_post = FactoryBot.create(:second_post, user_id: @user.id, shop_id: @shop.id)
    # driven_by(:rack_test) 
  end
  describe '表示テスト' do
    context '表示リスト' do
      it 'トップページ' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        expect(page).to have_content "test_1"
        expect(page).to have_content "test_2"
      end
      it 'ユーザーページ' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit user_path(@user.id)
        expect(page).to have_content "test_1"
        expect(page).to have_content "test_2"
      end
      it '店舗情報ページ' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit shop_path(@shop.id)
        expect(page).to have_content "test_1"
        expect(page).to have_content "test_2"
      end
    end
  end
  describe '投稿テスト' do
    context '成功' do
      it '投稿成功している場合(shopテーブルにも保存されるか)' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit new_post_path(shop_id:@shop.id)
        fill_in 'post[content]', with: "test"
        click_on "Create Post"
        expect(page).to have_content "test"
      end
    end
    context '失敗' do
      it '投稿失敗している場合' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit new_post_path(shop_id:@shop.id)
        click_on "Create Post"
        expect(visit shop_path(@shop.id)).not_to have_content "test"
      end
    end
  end
end