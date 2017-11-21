require 'pry'

class CashRegister
  attr_reader :discount, :items
  attr_accessor :total

  def initialize (discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @total += price * quantity
    @last_item_price = price * quantity
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if @discount > 0
      @total *= 1 - @discount/100.0
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_item_price
  end

end
