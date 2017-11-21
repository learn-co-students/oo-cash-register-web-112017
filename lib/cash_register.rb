require "pry"

class CashRegister

  attr_accessor :total, :discount

  def initialize (*discount)
    @total = 0
    @discount = discount[0]
    @items = []
  end

  def add_item (title, price, *quantity)
    quantity = quantity[0]
    if quantity == nil
      @transaction = price
      @total += @transaction
      @items.push(title)
    else
      @transaction = price * quantity
      @total += @transaction
      quantity.times { @items.push(title) }
    end
  end

  def apply_discount
    if @discount == nil
      "There is no discount to apply."
    else
      disc = @total * (@discount.to_f/100)
      @total -= disc
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @transaction
  end

end
