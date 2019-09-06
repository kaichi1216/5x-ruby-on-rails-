require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context '基本功能' do
    it "可以把商品丟到購物車裡 然後購物車就會有東西"do 
      cart = Cart.new
        expect(cart.empty?).to be true

      cart.add_item(1)
        expect(cart.empty?).to be false
    end

    it '加同種類的商品 購買項目 不會增加 但商品數量會改變' do
      cart = Cart.new
      3.times {cart.add_item(1)}
      2.times {cart.add_item(2)}
      2.times {cart.add_item(1)}

      expect(cart.items.count).to be 2
    end
  end


end
