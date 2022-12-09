require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    # ユーザー2名を事前に生成して登録
    @user = FactoryBot.create(:user)
    @another_user = FactoryBot.create(:user)
    # app/models/user.rbで定義したfollowメソッド（友達申請）の実行結果を変数@relationshipに代入
    @relationship = @user.follow!(@another_user)
  end

  describe '#create' do
    context 'successfully' do
      it 'is valid with follower_id, followed_id' do
        expect(@relationship).to be_valid
      end
    end

    context 'unsuccessfully' do
      it '友達申請する側の値（follower_id）がなければ保存できない。' do
        @relationship.follower_id = ''
        @relationship.valid?
        expect(@relationship).not_to be_valid
      end
      it '友達申請される側の値（followed_id）がなければ保存できない。' do
        @relationship.followed_id = ''
        @relationship.valid?
        expect(@relationship).not_to be_valid
      end
    end
  end
end