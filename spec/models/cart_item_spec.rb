require 'rails_helper'

RSpec.describe CartItem, type: :model do

  it '每個 Cart Item 都可以計算他自己的金額（小記）' do
    cart = Cart.new

    p1 = Product.create(name: 'aa',price: 100)
    p2 = Product.create(name: 'bb',price: 200)

    3.times {cart.add_item(p1.id)}
    2.times {cart.add_item(p2.id)}

    expect(cart.items.first.price).to be 300
  end

  it "計算總金額" do 
    cart = Cart.new

    p1 = Product.create(name: '凱琪', price: 100)
    p2 = Product.create(name: '佳穎', price: 200)

    3.times {cart.add_item(p1.id)}
    2.times {cart.add_item(p2.id)}

    expect(cart.total_price).to be 700

  end
 
end
