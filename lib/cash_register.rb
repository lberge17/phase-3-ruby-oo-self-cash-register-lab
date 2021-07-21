require "pry"
class CashRegister
  attr_accessor :discount, :total, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    @total += price * quantity
    
    quantity.times { @items << item }

    @last_transaction = [price, quantity]
  end

  def apply_discount
    if @discount != 0
      discount_amount = (@discount / 100.0) * @total
      @total -= discount_amount
      "After the discount, the total comes to $#{@total.to_i}."
    else 
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    binding.pry
    @total -= @last_transaction[0] * @last_transaction[1]
    @last_transaction[1].times { @items.pop }
    binding.pry
  end

end
