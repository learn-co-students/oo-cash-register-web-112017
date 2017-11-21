class CashRegister



  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
  end

  attr_accessor :total

  def total
    @total
  end


  def add_item(title, price, quantity = 1)
    @last_price = price*quantity
    @total += price * quantity
    quantity.times do @items << title end
  end

  def discount
    @discount
  end

  def apply_discount
    if @discount > 0
      @total *= 1 - @discount/100.0
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_price
  end

end
