require 'pry'

class CashRegister

  attr_accessor :discount, :total

  def initialize(*discount)
    @total = 0
    @discount = discount.first
    @items = []
    @prices = []
  end

  def add_item(item, price, *quantity)

    number = 1
    if quantity.size >= 1
      number = quantity.first
    end
    # binding.pry
    @total += price * number
    number.times do
      @items << item
      @prices << price
    end
  end

  def apply_discount
    # binding.pry
    if @discount
      @total = @total* ((100.00-@discount)/100.00)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @items.pop
    credit = @prices.pop
    @total -= credit
  end

end
