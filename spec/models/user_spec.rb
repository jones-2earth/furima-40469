require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'パスワードが6文字以上半角英数字であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
        expect(@user).to be_valid
      end
      it '名字が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.last_name = '山田'
        expect(@user).to be_valid
      end
      it '名前が全角（漢字・ひらがな・カタカナ）であれば登録できる' do
        @user.first_name = '陸太郎'
        expect(@user).to be_valid
      end
      it '名字のフリガナが全角（カタカナ）であれば登録できる' do
        @user.last_name_kana = 'ヤマダ'
        expect(@user).to be_valid
      end
      it '名前のフリガナが全角（カタカナ）であれば登録できる' do
        @user.first_name_kana = 'リクタロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが空欄だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'メールアドレスが空欄だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'メールアドレスがすでに登録しているユーザーと重複していると保存できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワード（確認含む）が5文字以下だと保存できない' do
        @user.password = 'ab123'
        @user.password_confirmation = 'ab123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "000000"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

    end
  end
end