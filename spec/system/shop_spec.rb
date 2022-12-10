require 'rails_helper'
RSpec.describe '投稿テスト', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @shop = FactoryBot.create(:shop, user_id: @user.id)
    @post = FactoryBot.create(:post,user_id: @user.id, shop_id: @shop.id)
    @second_post = FactoryBot.create(:second_post, user_id: @user.id, shop_id: @shop.id)
    # driven_by(:rack_test) 
  end
  describe 'ショップテスト' do
    context 'ショップ検索' do
      it '検索が可能' do
        visit new_user_session_path 
        fill_in 'user[email]', with: @user.email
        fill_in 'user[password]', with: @user.password
        click_on "Log in"
        sleep 0.2
        fill_in 'word', with: "ひばりヶ丘"
        click_on "検索"
        sleep 0.2
        page.first(".post_name").click
        find("#shop_content0").click
        sleep 1.0
        expect(page).to have_content "営業"
      end
    end
  end
end