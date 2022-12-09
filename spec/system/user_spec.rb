require 'rails_helper'
RSpec.describe 'ユーザー管理機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)
    @shop =  FactoryBot.create(:shop)
    # driven_by(:rack_test) 
  end
  describe 'ユーザー作成のテスト' do
    context 'ユーザーがログインせずにタスク一覧画面へ飛べない' do
      it 'タスク一覧画面に飛ぼうとしたとき、ログイン画面に遷移すること' do
        visit new_post_path(shop_id:@shop.id)
        expect(page).to have_content "Log in"
      end
    end
    context 'ユーザーを新規作成した場合' do
      it '新規登録できる' do
        visit new_user_registration_path
        fill_in 'user[name]', with: "test"
        fill_in 'user[email]', with: "test@email.com"
        fill_in 'user[password]', with: "testtest"
        fill_in 'user[password_confirmation]', with: "testtest"
        click_on 'Sign up'
        expect(page).to have_content "gmap"
      end
    end
  end
  describe 'セッション機能のテスト' do
    context 'セッション機能が問題ないかを確認' do
      it 'ログインができる。また、ログイン後にユーザー詳細ページに飛んでいる' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        expect(page).to have_content "ログインしました。"
      end
      it '他人の詳細ページに飛べる' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        visit user_path(@admin_user.id)
        expect(page).to have_content "管理者"
      end
      it 'ログアウトができる' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        click_on 'ログアウト'
        expect(page).to have_content "ログアウトしました"
      end
    end
    describe '管理者のテスト' do
      context '管理者機能に問題がないか確認' do
        it '管理ユーザは管理画面にアクセスできること' do
          visit new_user_session_path 
          fill_in 'user[email]', with: @admin_user.email
          fill_in 'user[password]', with: @admin_user.password
          click_on "Log in"
          visit rails_admin_path
          expect(page).to have_content "サイト管理"
        end
      end
    end
  end
end