require 'rails_helper'

RSpec.describe Cart, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "可以把商品丟到購物車裡 然後購物車就會有東西"do 
    cart = Cart.new
    expect(cart.empty?).to be true

    cart.add_item(1)
    expect(cart.empty?).to be false
  end
end
