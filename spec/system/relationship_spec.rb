require 'rails_helper'
RSpec.describe 'フォローテスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @second_user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user_id: @user.id)
    @post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @second_post = FactoryBot.create(:post,user_id: @second_user.id, shop_id: @shop.id)
  end
  describe 'フォローボタン' do
    context 'フォローが表示される' do
      it '自分のフォローができない' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
        visit user_path(@user.id)
        expect(page).to have_button 'フォロー'
      end
      it 'フォローする' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
        visit user_path(@second_user.id)
        click_button 'フォロー'
        expect(page).to have_content "#{@second_user.name}さんをフォローしました"
      end
      it 'フォロー解除する' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_button "ログイン"
        visit user_path(@second_user.id)
        click_button 'フォロー'
        click_button 'つながりを解除'
        expect(page).to have_content "#{@second_user.name}フォロー解除解除しました"
      end
    end
  end
end