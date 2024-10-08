require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @buyaddress = FactoryBot.build(:buy_address, user_id: user.id, item_id: item.id)
  end

  describe '購入' do
    context '購入できる場合' do
      it "postal_code、prefecture_id、city、house_number、tel、buy_id、tokenが存在すれば登録できる" do
          expect(@buyaddress).to be_valid
      end
      it "otherが空でも登録できる" do
        @buyaddress.other = ""
        expect(@buyaddress).to be_valid
      end
    end

    context '購入できない場合' do
      it 'postal_codeが空では保存できない' do
        @buyaddress.postal_code = ""
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Postal code must be in the format XXX-XXXX")
      end
      it 'prefecture_idが空では保存できない' do
        @buyaddress.prefecture_id = 1
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @buyaddress.city = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では保存できない' do
        @buyaddress.house_number = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("House number can't be blank")
      end
      it 'telが空では保存できない' do
        @buyaddress.tel = ''
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Tel is invalid")
      end
      it 'postal_codeが全角の場合は保存できない' do
        @buyaddress.postal_code = '１２３－４５６７'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Postal code must be in the format XXX-XXXX")
      end
      it 'postal_codeが8桁でないと保存できない' do
        @buyaddress.postal_code = '123-45678'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Postal code must be in the format XXX-XXXX")
      end
      it 'postal_codeが-を含まないと保存できない' do
        @buyaddress.postal_code = '1234567'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Postal code must be in the format XXX-XXXX")
      end
      it 'telが半角数字でないと保存できない' do
        @buyaddress.tel = '０９０１２３４５６７８'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが9桁以下だと保存できない' do
        @buyaddress.tel = '090123456'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Tel is invalid")
      end
      it 'telが12桁以上だと保存できない' do
        @buyaddress.tel = '090123456789'
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Tel is invalid")
      end
      it 'tokenが空では登録できないこと' do
        @buyaddress.token = nil
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @buyaddress.user_id = nil
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @buyaddress.item_id = nil
        @buyaddress.valid?
        expect(@buyaddress.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
