require "pry"
class CashRegister

  attr_accessor :total, :discount

  def initialize(*discount)
    @total = 0
    @discount = discount[0]
    @items = []
  end

  def add_item(title,price,*quantity)
    quantity = quantity[0]
    if quantity == nil
      @total += price
      @items << title
    else
      @total += price*quantity
      quantity.times do @items << title end
    end
    @last_transaction = price
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      dis = @total*(@discount.to_f/100)
      @total -= dis
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -=@last_transaction
  end
end
