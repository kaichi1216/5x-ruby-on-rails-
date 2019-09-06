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

    it "商品可以放到購物車裡 也可以再拿出來" do
      cart = Cart.new

      p1 = Product.create(name: 'aa', price: 100)
      p2 = Product.create(name: 'bb', price: 50)
      
      3.times {cart.add_item(p1.id)}
      2.times {cart.add_item(p2.id)}

      expect(cart.items.first.product).to be_a Product
    end

    
  end

  it '特別日期 全面打 9折' do
    #2/10 打九折
    t = Time.local(2008, 2, 10, 10, 5, 0)
        Timecop.travel(t)
    cart = Cart.new
    p1 = Product.create(name: 'aa', price: 100)
      p2 = Product.create(name: 'bb', price: 50)
      
      3.times {cart.add_item(p1.id)}
      2.times {cart.add_item(p2.id)}

      expect(cart.total_price).to eq 360

  end
end
