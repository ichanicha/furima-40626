require 'rails_helper'

RSpec.describe Buyaddress, type: :model do
  before do
    @buy = FactoryBot.build(:buy)
  end

escribe '購入' do
  context '購入できる場合' do
    it "postal_code、prefecture、city、house_number、tel、buy_idが存在すれば登録できる" do
        expect(@buyaddress).to be_valid
    end
  end

  context '購入できない場合' do
    it 'postal_codeが空では保存できない' do
      @buyaddress.postal_code = ""
      @buyaddress.valid?
      expect(@buyaddress.errors.full_messages).to include("Pstal Code can't be blank")
    end
    it 'nameが空では保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'descriptionが空では保存できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'category_idが空では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'condition_idが空では保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it 'shopping_charge_idが空では保存できない' do
      @item.shopping_charge_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shopping charge can't be blank")
    end
    it 'prefecture_idが空では保存できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'daily_idが空では保存できない' do
      @item.daily_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Daily can't be blank")
    end
    it 'priceが空では保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが半角数字以外の値が含まれている場合は保存できない' do
      @item.price = ３００
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが300未満の値では保存できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'priceが10000000以上の値では保存できないこと' do
      @item.price = 10000001
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it 'userが紐付いていないと保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
end