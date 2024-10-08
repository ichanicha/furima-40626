require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "nicknameとemail、password、password_confirmation、family_name、name、family_name_kana、name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it "nikcnameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      
      it "family_nameが空では登録できない" do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      
      it "nameが空では登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      
      it "name_kanaが空では登録できない" do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana is invalid")
      end
      
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      
      it "passwordが5文字以下では登録できない" do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      
      it "emailは@を含まないと登録できない" do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      
      it "passwordは英字のみでは登録できない" do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      
      it "passwordは数字のみでは登録できない" do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      
      it "passwordは全角だと登録できない" do
        @user.password = 'ＭＩＫＩ０４２６'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it "family_nameは半角文字が含まれていると登録できない" do
        @user.family_name = 'ｶﾉｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it "nameは半角文字が含まれていると登録できない" do
        @user.name = 'ﾐｷ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name is invalid')
      end
      it "family_name_kanaはカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.family_name_kana = 'かのう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name kana is invalid')
      end
      it "name_kanaはカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
        @user.name_kana = 'みき'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana is invalid')
      end
    end
  end
end

